import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/core/helpers/app_regex.dart';
import 'package:fruit/core/theming/style/colors.dart';
import 'package:fruit/core/widgets/custom_button.dart';
import 'package:fruit/core/widgets/text_form_field.dart';

import '../cubit/login_cubit/login_cubit.dart';
import 'forget_password.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final loginCubit=context.read<LoginCubit>();
    return Form(
      key: loginCubit.formKey,
      autovalidateMode: loginCubit.autoValidateMode,
      child: Column(
        children: [
          SizedBox(
            height: 12.h,
          ),
          AppTextFormField(controller: loginCubit.emailController,
              hintText: 'البريد الالكتروني', validator: emailValidate),
          SizedBox(
            height: 12.h,
          ),
          AppTextFormField(controller: loginCubit.passController,
            hintText: 'كلمة المرور',
            validator: passValidate,
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: ColorsManger.greyColor,
                )),
            isObscureText: obscureText,
          ),
          SizedBox(
            height: 12.h,
          ),
          ForgetPass(),
          SizedBox(
            height: 30.h,
          ),
          customButton(text: 'تسجيل دخول', onTap: (){
            validateLogin(context);
          }

          ),
        ],
      ),
    );
  }

  void validateLogin(BuildContext context) {
    final loginCubit=context.read<LoginCubit>();
    if(loginCubit.formKey.currentState!.validate()){
      loginCubit.formKey.currentState?.save();
      loginCubit.login();
    }

  }

  String? emailValidate(String? text) {
    // Check for null or empty input
    if (text == null || text.trim().isEmpty) {
      return 'Please enter a valid email address';
    }

    // Define a more precise email regex pattern
    final bool emailRegex = AppRegex.isEmailValid(text);

    // Check if the input matches the regex pattern
    if (!emailRegex) {
      return 'Email is not valid';
    }

    return null; // Email is valid
  }

  String? passValidate(String? text) {
    // Define regex for password validation
    final bool passwordRegex = AppRegex.isPasswordValid(text);

    // Null or empty check
    if (text == null || text.trim().isEmpty) {
      return 'Password is required';
    }

    // Check for password complexity
    // if (!passwordRegex) {
    //   return 'Password must have at least 8 characters, an uppercase letter, '
    //       'a lowercase letter, a digit, and a special character';
    // }

    return null; // Password is valid
  }

}
