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
                        itemBuilder: (context, index) => PetCardItem(
                          petSex: '${petLists[index].petGender}',
                          petName:
                              '${petLists[index].petName} ${petLists[index].petLastname}',
                          petBreed: '${petLists[index].petBreed}',
                          petLifetime: '7 years',
                          petPhoto: '${petLists[index].petPhoto}',
                          onPressed: () {
                            // print(petLists[index].petId);
                            Navigator.of(context).pushNamed(
                              '/MyPetProfilePage',
                              arguments: petLists[index].petId,
                            );
                          },
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
}
