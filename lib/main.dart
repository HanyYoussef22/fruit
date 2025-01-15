import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/fruit_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/di/dependenct_injection.dart';
import 'core/helpers/custom_boc_observer.dart';
import 'firebase_options.dart';
import 'core/helpers/constants.dart';
import 'core/helpers/shared_perfrance_helper.dart';
import 'core/routing/app_router.dart';

void main() async {
  setupGitIt();
  await ScreenUtil.ensureScreenSize();
  await isUserSeen();
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(FruitApp(
    appRouter: AppRouter(),
  ));
}

Future<bool> isUserSeen() async {
  isUserShown =
      await SharedPrefHelper.getBool(SharedPrefKeys.isOnboardingShown);
  return isUserShown;
}
