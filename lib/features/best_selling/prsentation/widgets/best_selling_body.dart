import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit/core/helpers/extenation.dart';
import 'package:fruit/core/theming/style/styles.dart';
import 'package:fruit/features/best_selling/prsentation/widgets/item_best_selling.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/theming/style/colors.dart';
import 'appbar_best_selling.dart';

class BestSellingBody extends StatelessWidget {
  const BestSellingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        // Scrollable AppBar
        AppbarBestSelling(),

        // Grid of Best Selling Items
        ItemBestSelling(),
      ],
    );
  }
}
