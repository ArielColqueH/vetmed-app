import 'package:flutter/material.dart';

import '../../components/bottomnav.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("settings"),
      ),
      bottomNavigationBar: BottomNav(index: 3),
    );
  }
}
