import 'package:flutter/material.dart';
import 'package:vetmed_app/utils/colors.dart';

import '../../components/bottomnav.dart';
import '../../widgets/PetCardItem.dart';
import '../../widgets/RecordCardItem.dart';
import '../../widgets/button-back.dart';
import '../home/widgets/bigtext.dart';

class RecordsPage extends StatelessWidget {
  const RecordsPage({Key? key}) : super(key: key);

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
              Row(
                children: [
                  ButtonBack(
                    color: secondaryColor,
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              BigText(
                texto: 'Registro de Mike Peñaloza',
              ),
              SizedBox(
                height: 16,
              ),
              RecordCardItem(
                recordName: 'Vacunas',
                lastRecordDate: 'Ultima actualización',
                onPressed: () {
                  Navigator.of(context).pushNamed('/RecordsListPage');
                }, recordIcon: 'vaccine',
              ),
              RecordCardItem(
                recordName: 'Desparasitación',
                lastRecordDate: 'Ultima actualización',
                onPressed: () {
                  Navigator.of(context).pushNamed('/RecordsListPage');
                }, recordIcon: 'desparasitation',
              ),
              RecordCardItem(
                recordName: 'Cirugías',
                lastRecordDate: 'Ultima actualización',
                onPressed: () {
                  Navigator.of(context).pushNamed('/RecordsListPage');
                }, recordIcon: 'surgery',
              ),

            ],
          ),
        ),
      ),
    );
  }
}
