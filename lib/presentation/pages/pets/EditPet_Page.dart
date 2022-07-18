import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
import '../../widgets/main_widgets.dart';

class EditMyPetPage extends StatefulWidget {
  const EditMyPetPage({Key? key}) : super(key: key);

  @override
  State<EditMyPetPage> createState() => _EditMyPetPageState();
}

class _EditMyPetPageState extends State<EditMyPetPage> {
  final _namePetTextController = TextEditingController();
  final _infoPetTextController = TextEditingController();
  final _breedPetTextController = TextEditingController();
  final _microchipPetTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 40,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              ButtonBack(
                color: secondaryColor,
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const TitleText(
                texto: 'Editar mascota',
              ),
              const SizedBox(
                height: 24,
              ),
              const TitleText(
                texto: 'Datos de tu mascota',
              ),
              const SizedBox(
                height: 8,
              ),
              InputNormal(
                placeholder: 'Nombre',
                textEditingController: _namePetTextController,
              ),
              const SizedBox(
                height: 8,
              ),
              InputNormal(
                placeholder: 'Información de mascota',
                textEditingController: _infoPetTextController,
              ),
              SizedBox(
                height: 24,
              ),
              const TitleText(
                texto: 'Detalles generales',
              ),
              const SizedBox(
                height: 8,
              ),
              InputNormal(
                placeholder: 'Raza',
                textEditingController: _breedPetTextController,
              ),
              const SizedBox(
                height: 8,
              ),
              InputNormal(
                placeholder: 'Microchip',
                textEditingController: _microchipPetTextController,
              ),
              SizedBox(
                height: 24,
              ),
              TitleText(
                texto: 'Género',
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  ButtonIconText(
                    color: primaryColor,
                    text: 'Ir a clínica',
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  ButtonIconText(
                    color: primaryColor,
                    text: 'Ir a clínica',
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              TitleText(
                texto: 'Edad',
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 24,
              ),
              TitleText(
                texto: 'Peso',
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 24,
              ),
              TitleText(
                texto: 'Imágenes',
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
