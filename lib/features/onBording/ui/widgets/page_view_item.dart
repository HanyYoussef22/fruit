import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit/core/theming/style/styles.dart';

class PageViewItem extends StatelessWidget {
  final bool isVisible;
  final String bgImage;
  final String image;
  final Widget subtitle;
  final Widget title;

  const PageViewItem(
      {super.key,
      required this.bgImage,
      required this.image,
      required this.subtitle,
      required this.title,  required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          visible: isVisible,
          child: Positioned(
            height: 20.h,
            width: 30.w,
            top: 20.h,
            right: 20.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("تخط",style: Styles.font13Grayscale500W600,textAlign: TextAlign.end,),
              ],
            ),
          ),
        ),
        SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.488,
            child: SvgPicture.asset(
              bgImage,
              fit: BoxFit.cover,
            )),

        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 160.h,
              ),
              SvgPicture.asset(image),
              SizedBox(
                height: 64.h,
              ),
              title,
              SizedBox(
                height: 24.h,
              ),
              subtitle,
            ],

          ),
        )
      ],
    );
  }
}
