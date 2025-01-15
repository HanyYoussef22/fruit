import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/core/helpers/constants.dart';
import 'package:fruit/core/routing/app_router.dart';
import 'package:fruit/core/routing/routes.dart';
import 'package:fruit/core/theming/style/colors.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


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
          //

          scaffoldBackgroundColor: ColorsManger.whiteColor,
        ),
        localizationsDelegates: const[
          // S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar'), // Arabic
          Locale('en'), // English
        ],

        locale:  Locale('ar'),
        initialRoute: isUserShown ? Routers.loginScreen : Routers.onBordingScreen,
          onGenerateRoute:  appRouter.generateRouter,

      ),
    );
  }
}
