import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/features/home/ui/widgets/home_appbar.dart';

import '../../../../core/widgets/custom_search.dart';
import 'offer_slider.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeAppBar(),
        SizedBox(
          height: 5.h ,
        ),
        SearchTextField(),
        SizedBox(
          height: 5.h ,
        ),
        OffersSlider(images: ['https://extension.okstate.edu/articles/images/food_storage_banner.jpg','https://extension.okstate.edu/articles/images/food_storage_banner.jpg'], titles: ['عرض العيد',''], descriptions: ['خصم 50%',''],),
      ],
    );
  }
}
