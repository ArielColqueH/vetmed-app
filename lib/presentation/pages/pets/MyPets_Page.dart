import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vetmed_app/utils/colors.dart';
import '../../../domain/entities/Pet.dart';
import '../../components/bottomnav.dart';
import '../../widgets/PetCardItem.dart';
import '../home/widgets/bigtext.dart';

class MyPetsPage extends StatelessWidget {
  const MyPetsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    Stream<List<Pet>> readPets() => FirebaseFirestore.instance
        .collection('Pet')
        .where("PetOwnerId", isEqualTo: user?.uid)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              return Pet.fromJson(doc.data());
            }).toList());
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 60,
            left: 16,
            right: 16,
            bottom: 20,
          ),
          child: Column(
            children: [
              BigText(
                texto: 'Mis mascotas',
              ),
              SizedBox(
                height: 16,
              ),
              StreamBuilder<List<Pet>>(
                  stream: readPets(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final petLists = snapshot.data!;
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: petLists.length,
                        itemBuilder: (context, index) => petLists.length != 0
                            ? PetCardItem(
                                petSex: '${petLists[index].petGender}',
                                petName:
                                    '${petLists[index].petName} ${petLists[index].petLastname}',
                                petBreed: '${petLists[index].petBreed}',
                                petLifetime:
                                    '${petYears(petLists[index].petBornDate)}',
                                petPhoto: '${petLists[index].petPhoto}',
                                onPressed: () {
                                  // print(petLists[index].petId);
                                  Navigator.of(context).pushNamed(
                                    '/MyPetProfilePage',
                                    arguments: petLists[index].petId,
                                  );
                                },
                              )
                            : Center(
                                child:
                                    Text("No tienes mascotas registradas aún"),
                              ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/AddMyPetPage');
        },
        backgroundColor: primaryColor,
        child: Icon(
          Icons.add,
          size: 24,
        ),
      ),
      bottomNavigationBar: BottomNav(index: 1),
    );
  }

  String petYears(petBornDate) {
    String bornDate = petBornDate.toString().split(" ")[0];
    List<String>? datedata = bornDate.split("-");
    DateTime date1 = DateTime(
        int.parse(datedata[0]), int.parse(datedata[1]), int.parse(datedata[2]));
    DateTime date2 = DateTime.now();
    int difference = daysBetween(date1, date2);
    int years = (difference / 365).floor();
    // print("years" + years.toString());
    String value = "";
    if (years != 0) {
      value = years.toString() + " años";
    } else {
      value = difference.toString() + " dias";
    }
    return value;
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }
}
