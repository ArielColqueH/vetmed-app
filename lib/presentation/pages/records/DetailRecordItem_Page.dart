import 'package:flutter/material.dart';
import 'package:vetmed_app/presentation/pages/records/widgets/DoctorListRecordItem.dart';
import 'package:vetmed_app/presentation/pages/records/widgets/RecordSubtitle.dart';
import 'package:vetmed_app/presentation/pages/records/widgets/RecordTitle.dart';

import '../../../utils/colors.dart';
import '../../components/bottomnav.dart';
import '../../widgets/PetCardItem.dart';
import '../../widgets/button-back.dart';
import '../home/widgets/bigtext.dart';

class DetailRecordListPage extends StatelessWidget {
  const DetailRecordListPage({Key? key}) : super(key: key);

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
                texto: 'Detalle',
              ),
              SizedBox(
                height: 16,
              ),
              RecordTitle(
                text: 'Médico veterinario',
              ),
              SizedBox(
                height: 8,
              ),
              RecordListCardItem(
                imageDoctor:
                    'https://images.unsplash.com/photo-1510771463146-e89e6e86560e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80',
                registeredCode: 'Matrícula: 225LP',
                doctorName: 'Luis Ortega Espinar',
              ),
              SizedBox(
                height: 16,
              ),
              RecordTitle(
                text: 'Datos de propietario',
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 11, right: 11, top: 14, bottom: 20),
                decoration: BoxDecoration(
                  color: primaryWhite,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RecordSubtitle(
                          color: secondaryColor,
                          texto: 'Propietario',
                        ),
                        RecordSubtitle(
                          color: primaryColor,
                          texto: 'Ariel Colque Herrera',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RecordSubtitle(
                          color: secondaryColor,
                          texto: 'Calle',
                        ),
                        RecordSubtitle(
                          color: primaryColor,
                          texto: 'Jaime Zudañes',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RecordSubtitle(
                          color: secondaryColor,
                          texto: 'Nro',
                        ),
                        RecordSubtitle(
                          color: primaryColor,
                          texto: '1167',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RecordSubtitle(
                          color: secondaryColor,
                          texto: 'Zona',
                        ),
                        RecordSubtitle(
                          color: primaryColor,
                          texto: 'Sopocachi',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RecordSubtitle(
                          color: secondaryColor,
                          texto: 'Ciudad',
                        ),
                        RecordSubtitle(
                          color: primaryColor,
                          texto: 'La Paz',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              RecordTitle(
                text: 'Información de la mascota',
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 11, right: 11, top: 14, bottom: 20),
                decoration: BoxDecoration(
                  color: primaryWhite,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RecordSubtitle(
                          color: secondaryColor,
                          texto: 'Especie',
                        ),
                        RecordSubtitle(
                          color: primaryColor,
                          texto: 'Canina',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RecordSubtitle(
                          color: secondaryColor,
                          texto: 'Raza',
                        ),
                        RecordSubtitle(
                          color: primaryColor,
                          texto: 'Salchicha',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RecordSubtitle(
                          color: secondaryColor,
                          texto: 'Sexo',
                        ),
                        RecordSubtitle(
                          color: primaryColor,
                          texto: 'Macho',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RecordSubtitle(
                          color: secondaryColor,
                          texto: 'Nombre',
                        ),
                        RecordSubtitle(
                          color: primaryColor,
                          texto: 'Mike',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RecordSubtitle(
                          color: secondaryColor,
                          texto: 'Color',
                        ),
                        RecordSubtitle(
                          color: primaryColor,
                          texto: 'Negro Fuego',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RecordSubtitle(
                          color: secondaryColor,
                          texto: 'Edad',
                        ),
                        RecordSubtitle(
                          color: primaryColor,
                          texto: '2 años y 6 meses',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              RecordTitle(
                text: 'Información de la vacuna',
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 11, right: 11, top: 14, bottom: 20),
                decoration: BoxDecoration(
                  color: primaryWhite,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RecordSubtitle(
                          color: secondaryColor,
                          texto: 'Contra',
                        ),
                        RecordSubtitle(
                          color: primaryColor,
                          texto: 'Coronavirus',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RecordSubtitle(
                          color: secondaryColor,
                          texto: 'Laboratorio',
                        ),
                        RecordSubtitle(
                          color: primaryColor,
                          texto: 'Vanguard',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RecordSubtitle(
                          color: secondaryColor,
                          texto: 'Serie',
                        ),
                        RecordSubtitle(
                          color: primaryColor,
                          texto: '459421',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RecordSubtitle(
                          color: secondaryColor,
                          texto: 'Procedente',
                        ),
                        RecordSubtitle(
                          color: primaryColor,
                          texto: 'USA',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RecordSubtitle(
                          color: secondaryColor,
                          texto: 'Expiración',
                        ),
                        RecordSubtitle(
                          color: primaryColor,
                          texto: '29 / 03/ 2022',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  fit: BoxFit.cover,
                  'https://images.unsplash.com/photo-1608326389386-0305acbe600f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8dmFjY2luZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                  height: 120.0,
                  width: 120.0,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              RecordTitle(
                text: 'Información de fecha de vacunación',
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 11, right: 11, top: 14, bottom: 20),
                decoration: BoxDecoration(
                  color: primaryWhite,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RecordSubtitle(
                          color: secondaryColor,
                          texto: 'Fecha de realización',
                        ),
                        RecordSubtitle(
                          color: primaryColor,
                          texto: '08/ 03/ 2022',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RecordSubtitle(
                          color: secondaryColor,
                          texto: 'Próxima fecha',
                        ),
                        RecordSubtitle(
                          color: primaryColor,
                          texto: '09/ 04/ 2023',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
