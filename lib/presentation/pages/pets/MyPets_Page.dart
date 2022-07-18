import 'package:flutter/material.dart';
import 'package:vetmed_app/utils/colors.dart';

import '../../components/bottomnav.dart';
import '../../widgets/PetCardItem.dart';
import '../home/widgets/bigtext.dart';

class MyPetsPage extends StatelessWidget {
  const MyPetsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("MyPets"),
      // ),
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
              PetCardItem(
                petSex: 'male',
                petName: 'Mike Peñaloza',
                petBreed: 'Golden',
                onPressed: () {
                  Navigator.of(context).pushNamed('/MyPetProfilePage');
                },
                petLifetime: '7 years',
                petPhoto:
                    'https://images.unsplash.com/photo-1510771463146-e89e6e86560e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80',
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
