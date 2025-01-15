import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit/core/helpers/extenation.dart';
import 'package:fruit/core/theming/style/colors.dart';
import 'package:fruit/core/theming/style/styles.dart';

import '../../../../../core/routing/routes.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'لا تمتلك حساب؟ ',
        style: Styles.font16GrayscaleW600,
        children: [
          TextSpan(
            text: 'قم بإنشاء حساب',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
               context.pushNamed(Routers.signupScreen);
              },
            style: Styles.font16greenW600,
          ),
        ],
      ),
    );
  }
}
