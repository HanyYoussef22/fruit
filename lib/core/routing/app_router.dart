import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/core/di/dependenct_injection.dart';
import 'package:fruit/core/networking/firebase_service/firebase_auth_service.dart';
import 'package:fruit/core/routing/routes.dart';
import 'package:fruit/features/auth/data/repos/auth_repo.dart';
import 'package:fruit/features/home/home_screen.dart';
import '../../features/auth/presentation/cubit/sinup_cubit.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/sinup_screen.dart';
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
      case Routers.signupScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<SinUpCubit>(),
                child: SinupScreen(),
              ),
        );
      case Routers.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );


      default:
        return null;
    }
  }
}