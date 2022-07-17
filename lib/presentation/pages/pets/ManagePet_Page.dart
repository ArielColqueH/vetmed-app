import 'package:flutter/material.dart';

import '../../components/bottomnav.dart';
import '../../widgets/PetCardItem.dart';
import '../home/widgets/bigtext.dart';

class ManageMyPetPage extends StatelessWidget {
  const ManageMyPetPage({Key? key}) : super(key: key);

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
                texto: 'Mis editar',
              ),
              SizedBox(
                height: 16,
              ),
              PetCardItem(
                petSex: 'male',
                petName: 'Mike Peñaloza',
                petBreed: 'Golden',
                onPressed: () {},
                petLifetime: '7 years',
                petPhoto:
                'https://images.unsplash.com/photo-1510771463146-e89e6e86560e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(index: 1),
    );
  }
}
