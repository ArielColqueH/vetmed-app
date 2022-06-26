import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            label: 'Mascotas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarms_sharp),
            label: 'Registros',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Mi cuenta',
          ),
        ]);
  }
}
