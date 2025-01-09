import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/core/theming/style/colors.dart';
import 'package:fruit/core/theming/style/styles.dart';

class OrDivider  extends StatelessWidget {
  const OrDivider ({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: ColorsManger.greyColor,
            thickness: 0.4,
          ),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Text(
            "أو",
            style: Styles.font16SemiBold,
          ),
        ),
        Expanded(
          child: Divider(
            color: ColorsManger.greyColor,
            thickness: 0.4,
          ),
        ),
      ],
    );
  }
}
