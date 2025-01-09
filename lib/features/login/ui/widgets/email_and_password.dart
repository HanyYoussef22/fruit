import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/core/theming/style/colors.dart';
import 'package:fruit/core/widgets/text_form_field.dart';
import 'package:fruit/features/login/ui/widgets/forget_password.dart';

import '../../../../core/widgets/custom_button.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 12.h,
        ),
        AppTextFormField(hintText: 'البريد الالكتروني', validator: (String) {}),
        SizedBox(
          height: 12.h,
        ),
        AppTextFormField(
          hintText: 'كلمة المرور',
          validator: (String) {},
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

        }
          
        ),
      ],
    );
  }
}
