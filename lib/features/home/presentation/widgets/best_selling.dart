import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/core/helpers/extenation.dart';
import 'package:fruit/core/theming/style/styles.dart';

import '../../../../core/routing/routes.dart';

class BestSelling extends StatelessWidget {
  const BestSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 10.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'الأكثر مبيعًا',
            style: Styles.font16BlackW300,
          ),
          GestureDetector(
              onTap: () {
                context.pushNamed(Routers.bestSellingScreen);
              },
              child: Text(
            'المزيد',
            style: Styles.font13Grayscale400,
          )),
        ],
      ),
    );
  }
}
