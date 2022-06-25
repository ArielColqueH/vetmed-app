import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class InputNormal extends StatelessWidget {
  final String placeholder;
  const InputNormal({Key? key, required this.placeholder}  ) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _textController = TextEditingController();
    return TextField(
      controller: _textController,
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
        suffixIcon: IconButton(
          onPressed: () {
            _textController.clear();
          },
          icon: const Icon(Icons.clear),
        ),
      ),
    );
  }
}

