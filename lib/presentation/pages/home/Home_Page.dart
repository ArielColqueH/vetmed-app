import 'package:flutter/material.dart';
import 'package:vetmed_app/presentation/components/bottomnav.dart';
import 'package:vetmed_app/presentation/pages/Home/widgets/bigtext.dart';

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
          children: const [
            SizedBox(
              height: 32,
            ),
            BigText(
              texto: 'Bienvenido Ariel',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
