

import 'package:flutter/material.dart';
import 'package:fruit/core/routing/routes.dart';

import '../../features/onBording/ui/onBording.dart';

class AppRouter {
  Route? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case Routers.onBordingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnbordingScreen(),
        );
      case Routers.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const OnbordingScreen(),
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