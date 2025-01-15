import 'package:flutter/material.dart';
import 'package:fruit/core/theming/style/styles.dart';

class ForgetPass extends StatelessWidget {
  const ForgetPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('نسيت كلمة المرور؟',style: Styles.font13green600Color,),
      ],
    );
  }
}
