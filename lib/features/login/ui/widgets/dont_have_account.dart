import 'package:flutter/material.dart';
import 'package:fruit/core/theming/style/colors.dart';
import 'package:fruit/core/theming/style/styles.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'لا تمتلك حساب؟ ',
        style: Styles.font16grayW600,
        children: [
          TextSpan(
            text: 'قم بإنشاء حساب',

            style: Styles.font16greenW600,
          ),
        ],
      ),
    );
  }
}
