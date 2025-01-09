import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/core/helpers/extenation.dart';
import 'package:fruit/core/theming/style/styles.dart';
import 'package:fruit/features/login/ui/widgets/dont_have_account.dart';
import 'package:fruit/features/login/ui/widgets/or_divider.dart';
import 'package:fruit/features/login/ui/widgets/social_login_button.dart';

import '../../../core/helpers/constants.dart';
import 'widgets/email_and_password.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(

          icon: Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            context.pop();
          },
        ),
        centerTitle: true,
        title: Text('تسجيل الدخول',style: Styles.font19Grayscale950W700,textAlign: TextAlign.center,),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w,vertical: 6.h),
          child: SingleChildScrollView(
            child: Column(spacing: 10.h,
              children: [
                EmailAndPassword(),
                SizedBox(height: 5.h,),
                DontHaveAccount(),
                SizedBox(height: 10.h,),
                OrDivider(),
                SocialLoginButton(iconPath: Assets.googleicon, text: 'تسجيل الدخول بواسطة جوجل',),
                SocialLoginButton(iconPath: Assets.appleicon, text: 'تسجيل بواسطة أبل',),
                SocialLoginButton(iconPath: Assets.facebookicon, text: 'تسجيل بواسطة فيسبوك',),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
