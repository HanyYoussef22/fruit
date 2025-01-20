import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/features/auth/presentation/login_widgets/social_login_button.dart';

import '../../../../core/helpers/constants.dart';
import '../cubit/login_cubit/login_cubit.dart';
import 'dont_have_account.dart';
import 'email_and_password.dart';
import 'or_divider.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              SocialLoginButton(iconPath: Assets.googleicon, text: 'تسجيل الدخول بواسطة جوجل', onPressed: (){
                emaitLoginWithGoogle(context);
              },),
              SocialLoginButton(iconPath: Assets.appleicon, text: 'تسجيل بواسطة أبل', onPressed: null, ),
              SocialLoginButton(iconPath: Assets.facebookicon, text: 'تسجيل بواسطة فيسبوك',onPressed:(){
                emaitLoginWithFacebook(context);
              }),
            ],
          ),
        ),
      ),
    );
  }
  emaitLoginWithGoogle(BuildContext context) {
    context.read<LoginCubit>().loginWithGoogle();
  }
  emaitLoginWithFacebook(BuildContext context) {
    context.read<LoginCubit>().loginWithFacebook();
  }
}
