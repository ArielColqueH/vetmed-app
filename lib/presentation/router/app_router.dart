import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vetmed_app/presentation/pages/Home/Home_Page.dart';
import 'package:vetmed_app/presentation/pages/authentication/SignUp_Page.dart';
import 'package:vetmed_app/presentation/pages/authentication/Welcome_Page.dart';
import 'package:vetmed_app/presentation/pages/home/ClinicLocation_Page.dart';
import 'package:vetmed_app/presentation/pages/home/ClinicProfile_Page.dart';
import 'package:vetmed_app/presentation/pages/home/DoctorProfile_Page.dart';
import 'package:vetmed_app/presentation/pages/pets/ManagePet_Page.dart';
import 'package:vetmed_app/presentation/pages/pets/MyPetProfile_Page.dart';
import 'package:vetmed_app/presentation/pages/pets/MyPets_Page.dart';
import 'package:vetmed_app/presentation/pages/records/ChooseRecordPet_Page.dart';
import 'package:vetmed_app/presentation/pages/settings/MyAccount_Page.dart';

import '../pages/authentication/Login_Page.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const WelcomePage());
        break;
      case '/LoginPage':
        return MaterialPageRoute(builder: (_) => const LoginPage());
        break;
      case '/SignUpPage':
        return MaterialPageRoute(builder: (_) => const SignUpPage());
        break;
      case '/HomePage':
        return MaterialPageRoute(builder: (_) => const HomePage());
        break;
      case '/DoctorProfilePage':
        return MaterialPageRoute(builder: (_) => const DoctorProfilePage());
        break;
      case '/ClinicProfilePage':
        return MaterialPageRoute(builder: (_) => const ClinicProfilePage());
        break;
      case '/ClinicLocationPage':
        return MaterialPageRoute(builder: (_) => const ClinicLocationPage());
        break;
      case '/MyPetsPage':
        return MaterialPageRoute(builder: (_) => const MyPetsPage());
        break;
      case '/MyPetProfilePage':
        return MaterialPageRoute(builder: (_) => const MyPetProfilePage());
        break;
      case '/ManageMyPetPage':
        return MaterialPageRoute(builder: (_) => const ManageMyPetPage());
        break;
      case '/ChooseRecordPetPage':
        return MaterialPageRoute(builder: (_) => const ChooseRecordPetPage());
        break;
      case '/MyAccountPage':
        return MaterialPageRoute(builder: (_) => const MyAccountPage());
        break;

      default:
        return MaterialPageRoute(builder: (_) => const WelcomePage());
        break;
    }
  }
}
