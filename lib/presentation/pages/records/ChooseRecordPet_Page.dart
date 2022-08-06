import 'package:flutter/material.dart';

import '../../components/bottomnav.dart';
import '../../widgets/PetCardItem.dart';
import '../home/widgets/bigtext.dart';

class ChooseRecordPetPage extends StatelessWidget {
  const ChooseRecordPetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(index: 2),
      body: SingleChildScrollView(
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
                texto: 'Registros',
              ),
              SizedBox(
                height: 16,
              ),
              PetCardItem(
                petSex: 'male',
                petName: 'Mike Peñaloza',
                petBreed: 'Golden',
                onPressed: () {
                  Navigator.of(context).pushNamed('/RecordsPage');
                },
                petLifetime: '7 years',
                petPhoto:
                'https://images.unsplash.com/photo-1510771463146-e89e6e86560e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
