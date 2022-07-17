import 'package:flutter/material.dart';

import '../../components/bottomnav.dart';
class ChooseRecordPetPage extends StatelessWidget {
  const ChooseRecordPetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Records"),
      ),
      bottomNavigationBar: BottomNav(index: 2),
    );
  }
}
