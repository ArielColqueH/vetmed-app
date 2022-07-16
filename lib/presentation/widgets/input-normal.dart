import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class InputNormal extends StatelessWidget {
  final String? placeholder;
  final TextEditingController? textEditingController;
  final bool? obscure;

  const InputNormal(
      {Key? key,
      required this.placeholder,
      required this.textEditingController,
      this.obscure = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure!,
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: placeholder,
        hintText: placeholder,
        enabledBorder: OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderSide: BorderSide(
            color: primaryColor,
            width: 0.0,
          ),
        ),
        border: const OutlineInputBorder(),
        // suffixIcon: IconButton(
        //   onPressed: () {
        //     textEditingController?.clear();
        //   },
        //   icon: const Icon(Icons.clear),
        // ),
      ),
    );
  }
}
