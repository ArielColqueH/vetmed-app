import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vetmed_app/presentation/pages/Home/Home_Page.dart';
import 'package:vetmed_app/presentation/pages/authentication/Login_Page.dart';
import 'package:vetmed_app/presentation/pages/authentication/Welcome_Page.dart';
import 'package:vetmed_app/presentation/pages/authentication/SignUp_Page.dart';
import 'package:vetmed_app/presentation/router/app_router.dart';
import 'package:vetmed_app/utils/colors.dart';
import 'domain/bloc/app/app_bloc.dart';
import 'firebase_options.dart';

void main() async {
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      runApp(const MyApp());
    },
    blocObserver: AppBloc(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: backgroundWhite,
      ),
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }
}
