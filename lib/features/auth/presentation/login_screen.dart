import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/core/helpers/extenation.dart';

import 'package:fruit/core/theming/style/styles.dart';
import 'package:fruit/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:fruit/features/auth/presentation/cubit/login_cubit/login_state.dart';
import 'package:fruit/features/auth/presentation/login_widgets/email_and_password.dart';
import 'package:fruit/features/auth/presentation/login_widgets/social_login_button.dart';

import '../../../../core/helpers/constants.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/style/colors.dart';
import '../../../core/widgets/custom_snackbar.dart';
import 'login_widgets/dont_have_account.dart';
import 'login_widgets/login_body.dart';
import 'login_widgets/or_divider.dart';


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
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text('تسجيل الدخول', style: Styles.font19Grayscale950W700,
          textAlign: TextAlign.center,),
      ),
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: ColorsManger.primaryColor,
                    ),
                  );
                },
              );
            },
            success: (response) {
              CustomSnackBar.show(context, "تم تسجيل الدخول بنجاح");
              context.pop();
              context.pushReplacementNamed(Routers.homeScreen);
            },
            error: (error) {
              context.pop();
              CustomSnackBar.show(context, error);
              // print("$error");
            },
          );


        },
        builder: (context, state) {
          return LoginBody();
        },
      ),
    );
  }
}
