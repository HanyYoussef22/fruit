import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit/core/helpers/constants.dart';
import 'package:fruit/core/helpers/extenation.dart';
import 'package:fruit/core/theming/style/styles.dart';

import '../../../../core/theming/style/colors.dart';

class AppbarBestSelling extends StatelessWidget {
  const AppbarBestSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 110.h,
      toolbarHeight: 45.h,
      floating: true,
      pinned: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: Icon(
          Icons.arrow_back_ios_new_outlined,
          color: ColorsManger.blackColor,
        ),
      ),
      actions: [
        CircleAvatar(
          radius: 25.r,
          backgroundColor:Colors.transparent,
          child:Stack(
            children: [
              SvgPicture.asset(Assets.notification),
              Positioned(
                  top: 0,
                  right: 6.5,
                  child: SvgPicture.asset(Assets.notfiRed))
            ],
          ),
        )
      ],
      backgroundColor: ColorsManger.whiteColor,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('الأكثر مبيعًا', style: Styles.font16BlackW700),
        centerTitle: true,


      ),
    ) ;
  }
}
