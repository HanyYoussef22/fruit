import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/fruit_app.dart';

import 'core/helpers/constants.dart';
import 'core/helpers/shared_perfrance_helper.dart';
import 'core/routing/app_router.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  await isUserSeen();
  runApp(FruitApp(
    appRouter: AppRouter(),
  ));
}
Future<bool> isUserSeen() async {
  // isUserShown = await SharedPrefHelper.getBool(SharedPrefKeys.isOnboardingShown);
  return isUserShown;
}