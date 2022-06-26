import 'package:flutter/material.dart';

import '../../components/bottomnav.dart';

class MyPetsPage extends StatelessWidget {
  const MyPetsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyPets"),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
