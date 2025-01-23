import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lewedly/busuness_logic/cubit/auth_cubit.dart';
import 'package:lewedly/busuness_logic/cubit/touslistsignalement_cubit.dart';
import 'package:lewedly/data/networkService.dart';
import 'package:lewedly/data/repository.dart';
import 'package:lewedly/presentations/constants/strings.dart';
import 'package:lewedly/presentations/screens/HomePage/home.dart';
import 'package:lewedly/presentations/screens/Login/login.dart';
import 'package:lewedly/presentations/screens/Registre/registre.dart';
import 'package:lewedly/presentations/screens/Splash/splash.dart';

import 'busuness_logic/cubit/malistsignalement_cubit.dart';
import 'busuness_logic/cubit/registre_cubit.dart';

class AppRouter {
  Route? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case loginPage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AuthCubit(
                      repository: Repository(networkService: NetworkService())),
                  child: const LoginPage(),
                ));
      case registre:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => RegistreCubit(
                      repository: Repository(networkService: NetworkService())),
                  child: const Registre(),
                ));
      case home:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => TouslistsignalementCubit(
                      repository: Repository(networkService: NetworkService())),
                  child: const HomePage(),
                ));
      default:
        return null;
    }
  }
}
