
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/core/theming/style/colors.dart';

Widget customButton({
  required String text,
  required onTap,
  double? radius,
  double? height,
  double? width,
}) {
  return SizedBox(
    height: height ?? 54.h,
    width: width??double.infinity,
    child: ElevatedButton(

      style: ElevatedButton.styleFrom(
          backgroundColor:  ColorsManger.primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 16 )
          )
      ),
      onPressed: onTap,
      child: Text(
        text,
        style:  TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 16.sp,
          fontFamily: 'Cairo',),
      ),
    ),
  );
}

