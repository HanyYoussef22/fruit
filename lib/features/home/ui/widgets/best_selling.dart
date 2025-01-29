import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/core/theming/style/styles.dart';

class BestSelling extends StatelessWidget {
  const BestSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 10.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('الأكثر مبيعًا',style: Styles.font16BlackW700,),
          Text('المزيد',style: Styles.font13Grayscale400,),
        ],
      ),
    );
  }
}
