import 'package:flutter/material.dart';
import 'package:vetmed_app/utils/colors.dart';
import '../../../utils/colors.dart';
import '../../widgets/atoms/button-normal.dart';

class SingUpPage extends StatelessWidget {
  const SingUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage(
                "assets/images/img-veterinary-pet.png",
              ),
            ),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: "Hi",
                enabledBorder: OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: BorderSide(
                    color: primaryColor,
                    width: 0.0,
                  ),
                ),
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    _textController.clear();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Una app para ti y tu mascota",
              style: TextStyle(
                  color: primaryBlack,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 48,
            ),
            ButtonNormal(
              color: primaryColor,
              text: 'Empecemos',
            ),
          ],
        ),
      ),
    );
  }
}
