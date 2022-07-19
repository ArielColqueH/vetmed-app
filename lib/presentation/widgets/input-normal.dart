import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class InputNormal extends StatelessWidget {
  final String? placeholder;
  final TextEditingController? textEditingController;
  final bool? obscure;
  final bool isTextArea;

  const InputNormal(
      {Key? key,
      required this.placeholder,
      required this.textEditingController,
      this.obscure = false,
      this.isTextArea = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: isTextArea? 4 : 1,
      obscureText: obscure!,
      controller: textEditingController,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: primaryBlack),
        labelText: placeholder,
        hintText: placeholder,
        hoverColor: primaryColor,
        focusedBorder: OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderSide: BorderSide(
            color: primaryColor,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderSide: BorderSide(
            color: primaryColor,
            width: 1.0,
          ),
        ),
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
