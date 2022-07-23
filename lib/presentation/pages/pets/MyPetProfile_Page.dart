import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
import '../../widgets/main_widgets.dart';
import '../pets/widgets/pet_widgets.dart';

class MyPetProfilePage extends StatelessWidget {
  const MyPetProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: 800,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: Container(
                  width: size.width,
                  height: 400.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1510771463146-e89e6e86560e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 16,
                child: Row(
                  children: [
                    ButtonBack(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 340,
                child: Container(
                  decoration: BoxDecoration(
                    color: backgroundWhite,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  width: size.width,
                  height: 180,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 24,
                        ),
                        const TitleText(
                          texto: 'Mike Peñaloza',
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClinicInfoCard(
                                titleCardPet: "Raza", textCardPet: "Golden"),
                            ClinicInfoCard(
                                titleCardPet: "Sexo", textCardPet: "Macho"),
                            ClinicInfoCard(
                                titleCardPet: "Edad", textCardPet: "+3 años"),
                            ClinicInfoCard(
                                titleCardPet: "Peso", textCardPet: "12 Kg"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 490,
                child: Container(
                  decoration: BoxDecoration(
                    color: primaryWhite,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  width: size.width,
                  height: 350,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 24,
                        ),
                        TitleText(
                          texto: 'Bio',
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        SimpleText(
                          texto:
                              'Soy Mike, me distraen bastante los juguetes y me divierto con ellos hasta destrozarlos. No tengo problemas conociendo a nuevas personas pero si a sus mascotas, no me llevo muy bien con ellas, un poco si con la hembras. Hasta ahora no he tenido problemas graves en mi salud pero uno nunca sabe.',
                        ),
                        SizedBox(
                          height: 42,
                        ),
                        ButtonNormal(
                          color: primaryColor,
                          text: 'Editar',
                          onPressed: () {
                            Navigator.of(context).pushNamed('/EditMyPetPage');
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
