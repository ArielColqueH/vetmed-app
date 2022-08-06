import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vetmed_app/presentation/pages/Home/Home_Page.dart';
import 'package:vetmed_app/presentation/pages/authentication/SignUp_Page.dart';
import 'package:vetmed_app/presentation/pages/authentication/Welcome_Page.dart';
import 'package:vetmed_app/presentation/pages/home/ClinicLocation_Page.dart';
import 'package:vetmed_app/presentation/pages/home/ClinicProfile_Page.dart';
import 'package:vetmed_app/presentation/pages/home/DoctorProfile_Page.dart';
import 'package:vetmed_app/presentation/pages/pets/AddPet_Page.dart';
import 'package:vetmed_app/presentation/pages/pets/EditPet_Page.dart';
import 'package:vetmed_app/presentation/pages/pets/MyPetProfile_Page.dart';
import 'package:vetmed_app/presentation/pages/pets/MyPets_Page.dart';
import 'package:vetmed_app/presentation/pages/records/ChooseRecordPet_Page.dart';
import 'package:vetmed_app/presentation/pages/records/DetailRecordItem_Page.dart';
import 'package:vetmed_app/presentation/pages/records/RecordsList_Page.dart';
import 'package:vetmed_app/presentation/pages/records/Records_Page.dart';
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
        final arguments = routeSettings.arguments;
        return MaterialPageRoute(
            builder: (_) => MyPetProfilePage(petId: arguments.toString()));
        break;
      case '/EditMyPetPage':
        final arguments = routeSettings.arguments;
        return MaterialPageRoute(
            builder: (_) => EditMyPetPage(petId: arguments.toString()));
        break;
      case '/AddMyPetPage':
        return MaterialPageRoute(builder: (_) => const AddMyPetPage());
        break;
      case '/ChooseRecordPetPage':
        return MaterialPageRoute(builder: (_) => const ChooseRecordPetPage());
        break;
      case '/RecordsPage':
        return MaterialPageRoute(builder: (_) => const RecordsPage());
        break;
      case '/RecordsListPage':
        return MaterialPageRoute(builder: (_) => const RecordsListPage());
        break;
      case '/DetailRecordItem':
        return MaterialPageRoute(builder: (_) => const DetailRecordListPage());
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
