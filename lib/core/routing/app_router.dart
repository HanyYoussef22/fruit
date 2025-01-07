

import 'package:flutter/material.dart';
import 'package:fruit/core/routing/routes.dart';
import 'package:fruit/features/login/ui/login_screen.dart';

import '../../features/onBording/ui/onBoarding.dart';

class AppRouter {
  Route? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case Routers.onBordingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnbordingScreen(),
        );
      case Routers.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );


      //case Routers.signupScreen:
      //   return MaterialPageRoute(
      //     builder: (_) =>
      //         BlocProvider(
      //           create: (context) => getIt<SinupCubit>(),
      //           child: const SinupScreen(),
      //         ),
      //   );
      // case Routers.homeScreen:
      //   return MaterialPageRoute(
      //     builder: (_) =>
      //         BlocProvider(
      //           create: (context) => HomeCubit(getIt())..getSpecialization(),
      //           child: const HomeScreen(),
      //         ),
      //   );


      default:
        return null;
    }
  }
}