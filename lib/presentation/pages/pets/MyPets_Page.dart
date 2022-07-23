import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        .map((snapshot) =>
            snapshot.docs.map((doc) => Pet.fromJson(doc.data())).toList());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 60,
            left: 16,
            right: 16,
            bottom: 40,
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
                    print(snapshot.data);
                    if (snapshot.hasData) {
                      final petLists = snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: petLists.length,
                        itemBuilder: (context, index) => PetCardItem(
                          petSex: '${petLists[index].petGender}',
                          petName:
                              '${petLists[index].petName} ${petLists[index].petLastname}',
                          petBreed: '${petLists[index].petBreed}',
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed('/MyPetProfilePage');
                          },
                          petLifetime: '7 years',
                          petPhoto: '${petLists[index].petPhoto}',
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
