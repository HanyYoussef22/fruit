import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/core/helpers/constants.dart';
import 'package:fruit/core/routing/app_router.dart';
import 'package:fruit/core/routing/routes.dart';
import 'package:fruit/core/theming/style/colors.dart';
import 'package:fruit/main.dart';

import 'core/helpers/shared_perfrance_helper.dart';

class FruitApp extends StatelessWidget {
  final AppRouter appRouter;
  const FruitApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Cairo',
          primaryColor: ColorsManger.primaryColor,
          scaffoldBackgroundColor: ColorsManger.whiteColor,
        ),
        initialRoute: isUserShown ? Routers.loginScreen : Routers.onBordingScreen,
          onGenerateRoute:  appRouter.generateRouter,

      ),
    );
  }
}
