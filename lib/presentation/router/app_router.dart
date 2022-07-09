import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vetmed_app/presentation/pages/Home/Home_Page.dart';
import 'package:vetmed_app/presentation/pages/authentication/SignUp_Page.dart';
import 'package:vetmed_app/presentation/pages/authentication/Welcome_Page.dart';
import 'package:vetmed_app/presentation/pages/home/ClinicProfile_Page.dart';

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
        return MaterialPageRoute(builder: (_) => const HomePage());
        break;
      case '/ClinicProfilePage':
        return MaterialPageRoute(builder: (_) => const ClinicProfilePage());
        break;
      default:
        return MaterialPageRoute(builder: (_) => const WelcomePage());
        break;
    }
  }
}
