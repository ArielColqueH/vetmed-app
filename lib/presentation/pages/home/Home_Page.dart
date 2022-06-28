import 'package:flutter/material.dart';
import 'package:vetmed_app/presentation/components/bottomnav.dart';

import '../../../utils/main_utils.dart';
import '../../widgets/main_widgets.dart';
import '../home/widgets/home_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 40,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            const BigText(
              texto: 'Bienvenido Ariel',
            ),
            const SizedBox(
              height: 8,
            ),
            const Subtitle(
              texto:
                  'Cuidar y amar a nuestras mascotas es nuestra responsabilidad',
            ),
            const SizedBox(
              height: 24,
            ),
            const TitleText(
              texto: 'Clínicas veterinarias',
            ),
            const SizedBox(
              height: 8,
            ),
            ClinicItem(
              clinicStars: 4.5,
              clinicLocation: 'Sopocachi',
              clinicName: 'Clínica Angeles y Guardianes',
              clinicPricing: 3,
              clinicImage:
                  'https://images.unsplash.com/photo-1656326125836-b3422f35343a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
              clinicAttention: 200.0,
            ),
            const TitleText(
              texto: 'Veterinarios Especialistas',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
