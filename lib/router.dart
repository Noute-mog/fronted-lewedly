import 'package:flutter/material.dart';
import 'package:lewedly/presentations/constants/strings.dart';
import 'package:lewedly/presentations/screens/HomePage/home.dart';
import 'package:lewedly/presentations/screens/Login/login.dart';
import 'package:lewedly/presentations/screens/Registre/registre.dart';
import 'package:lewedly/presentations/screens/Splash/splash.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case loginPage:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case registre:
        return MaterialPageRoute(builder: (_) => const Registre());
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return null;
    }
  }
}
