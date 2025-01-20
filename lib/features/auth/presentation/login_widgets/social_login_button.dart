import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit/core/theming/style/colors.dart';
import 'package:fruit/core/theming/style/styles.dart';

import '../cubit/login_cubit/login_cubit.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({super.key, required this.iconPath, required this.text,required this.onPressed});
  final String iconPath;
  final String text;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55.h,
      child: TextButton(

        style: TextButton.styleFrom(

          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: ColorsManger.borderGray, width: 1),
            borderRadius: BorderRadius.circular(18),
          ),

        ),
        onPressed: onPressed,
      child: ListTile(
        visualDensity: VisualDensity( vertical:VisualDensity.minimumDensity),
        title: Text(text,style: Styles.font16SemiBold,textAlign: TextAlign.center,),
        leading:  SvgPicture.asset(iconPath),
      )
        ,),
    );
  }

}
