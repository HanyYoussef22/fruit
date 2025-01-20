import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/core/theming/style/colors.dart';
import 'package:fruit/core/widgets/text_form_field.dart';

import '../../../../core/helpers/app_regex.dart';
import '../cubit/sinup_cubit/sinup_cubit.dart';


class EmailAndPasswordSinup extends StatefulWidget {
  const EmailAndPasswordSinup({super.key});

  @override
  State<EmailAndPasswordSinup> createState() => _EmailAndPasswordSinupState();
}

class _EmailAndPasswordSinupState extends State<EmailAndPasswordSinup> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    final sinUpCubit=context.read<SinUpCubit>();
    return Form(
      key: sinUpCubit.formKey,
      autovalidateMode: sinUpCubit.autoValidateMode,
      child: Column(spacing: 10.h,
        children: [
          AppTextFormField(controller: sinUpCubit.nameController,hintText: 'الاسم كامل', validator:nameValidate),
          AppTextFormField(controller: sinUpCubit.emailController,hintText: 'البريد الالكتروني', validator: emailValidate),
          AppTextFormField(controller: sinUpCubit.passController,
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
        ],
      ),
    );
  }

   String? nameValidate(String? text) {
    if (text == null || text.trim().isEmpty) {
      return 'Name is required';
    }
    if (AppRegex.isNameValid(text.trim())) {
      return 'Name must contain only letters and spaces, and be 2–50 characters long';
    }
    return null; // Name is valid
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
