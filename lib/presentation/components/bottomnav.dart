import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vetmed_app/utils/colors.dart';

class BottomNav extends StatefulWidget {
  final int index;

  const BottomNav({Key? key, required this.index}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        indicatorColor: primaryColorLight,
        labelTextStyle: MaterialStateProperty.all(
          TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
        ),
      ),
      child: NavigationBar(
        height: 60.0,
        backgroundColor: primaryWhite,
        selectedIndex: widget.index,
        onDestinationSelected: (index) => setState(() {
          print(index);
          switch (index) {
            case 0:
              Navigator.of(context).pushNamed('/HomePage');
              break;
            case 1:
              Navigator.of(context).pushNamed('/MyPetsPage');
              break;
            case 2:
              Navigator.of(context).pushNamed('/ChooseRecordPetPage');
              break;
            case 3:
              Navigator.of(context).pushNamed('/MyAccountPage');
              break;
          }
        }),
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.home,
              color: secondaryColor,
            ),
            label: "Inicio",
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              "assets/icons/vetmed-pawn.svg",
              color: secondaryColor,
            ),
            label: "Mascotas",
          ),
          NavigationDestination(
            icon: Icon(
              Icons.folder_rounded,
              color: secondaryColor,
            ),
            label: "Mi cuenta",
          ),
          NavigationDestination(
            icon: Icon(
              Icons.account_circle,
              color: secondaryColor,
            ),
            label: "Mi cuenta",
          ),
        ],
      ),
    );
  }
}
// BottomNavigationBarItem(
// icon: Icon(Icons.home),
// label: 'Inicio',
// ),
// BottomNavigationBarItem(
// icon: Icon(Icons.ac_unit),
// label: 'Mascotas',
// ),
// BottomNavigationBarItem(
// icon: Icon(Icons.access_alarms_sharp),
// label: 'Registros',
// ),
// BottomNavigationBarItem(
// icon: Icon(Icons.settings),
// label: 'Mi cuenta',
// ),
