import 'package:flutter/material.dart';
import 'package:vetmed_app/presentation/pages/records/widgets/RecordListCardItem.dart';

import '../../../utils/colors.dart';
import '../../components/bottomnav.dart';
import '../../widgets/PetCardItem.dart';
import '../../widgets/button-back.dart';
import '../home/widgets/bigtext.dart';

class RecordsListPage extends StatelessWidget {
  const RecordsListPage({Key? key}) : super(key: key);

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
              BigText(
                texto: 'Registro de vacunas',
              ),
              SizedBox(
                height: 16,
              ),
              RecordListCardItem(
                onPressed: () {
                  Navigator.of(context).pushNamed('/DetailRecordItem');
                },
                recordDetailName: 'HEXAVALENTE',
                lastRecordDate: '14/14/2022',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
