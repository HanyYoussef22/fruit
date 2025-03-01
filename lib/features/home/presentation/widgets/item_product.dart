import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit/core/theming/style/colors.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/theming/style/styles.dart';
import '../../../../core/widgets/custom_button.dart';
import 'custom_button_nav.dart';

class ItemProduct extends StatelessWidget {
  const ItemProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManger.lightGray,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w,top: 10.h),
        child: Stack(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(Assets.heart)),
            Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Image.asset(Assets.profileImage),

                SizedBox(
                  height: 24.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    RichText(

                      text: TextSpan(children: [
                         TextSpan(
                          text: 'بطيخ\n',
                          style: Styles.font13BlackW700,
                        ),
                        TextSpan(
                          text: '20جنية/',
                          style: Styles.font13OrangeW700,
                        ),
                        TextSpan(
                          text: 'الكيلو ',
                          style: Styles.font13OrangeW300,
                        ),
                      ]),
                    ),
                    CircleAvatar(
                      backgroundColor: ColorsManger.primaryColor,
                      child: Icon(
                        Icons.add,
                        color: ColorsManger.whiteColor,
                      ),
                    )]),
              ],
            )
          ],
        ),
      ),
    );
  }
}
