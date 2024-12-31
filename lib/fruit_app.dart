import 'package:flutter/material.dart';
import 'package:fruit/core/routing/app_router.dart';
import 'package:fruit/core/routing/routes.dart';
import 'package:fruit/core/theming/style/colors.dart';

class FruitApp extends StatelessWidget {
  final AppRouter appRouter;
  const FruitApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorsManger.primaryColor,
        scaffoldBackgroundColor: ColorsManger.whiteColor,
      ),
      initialRoute: Routers.onBordingScreen,
        onGenerateRoute: appRouter.generateRouter,

    );
  }
}
