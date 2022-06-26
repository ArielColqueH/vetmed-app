import 'package:flutter/material.dart';
import 'package:vetmed_app/presentation/pages/Home/widgets/bigtext.dart';
import 'package:vetmed_app/presentation/pages/authentication/widgets/button-logo.dart';
import 'package:vetmed_app/presentation/pages/authentication/widgets/divider-detail.dart';
import 'package:vetmed_app/presentation/widgets/button-back.dart';
import 'package:vetmed_app/utils/colors.dart';
import '../../../utils/colors.dart';
import '../../widgets/button-normal.dart';
import '../../widgets/input-normal.dart';
import '../../widgets/subtitle.dart';
import '../../widgets/title.dart';
import '../../widgets/two-link-text.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textController = TextEditingController();
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
    );
  }
}
