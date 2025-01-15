import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit/core/helpers/extenation.dart';
import 'package:fruit/core/theming/style/styles.dart';


class HaveAccount extends StatelessWidget {
  const HaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'تمتلك حساب بالفعل؟ ',
            style: Styles.font13GrayscaleW700,
          ),
          TextSpan(
            text: ' تسجيل دخول',
            style: Styles.font13green600Color,
            recognizer: TapGestureRecognizer()
            ..onTap = () {

            },
          ),
        ],
      ),
    );


  }

  }
Widget haveAreadyAccount(BuildContext context)
{
  return RichText(text: TextSpan(
    children: [
      TextSpan(
        text: 'تمتلك حساب بالفعل؟ ',
        style: Styles.font16GrayscaleW600,),
        TextSpan(
          text: 'تسجيل دخول ',
          style: Styles.font16greenW600,
          recognizer: TapGestureRecognizer()..onTap=(){
            context.pop();
        }
        ),


    ]
  ));
}