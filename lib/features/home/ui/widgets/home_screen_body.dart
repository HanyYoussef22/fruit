import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/features/home/ui/widgets/grid_view_item.dart';
import 'package:fruit/features/home/ui/widgets/home_appbar.dart';

import '../../../../core/widgets/custom_search.dart';
import 'best_selling.dart';
import 'offer_slider.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final images = [
      'https://extension.okstate.edu/articles/images/food_storage_banner.jpg',
      'https://extension.okstate.edu/articles/images/food_storage_banner.jpg'
    ];
    final titles = [' عرض العيد', ' توصيل'];
    final descriptions = [' خصم 50%', ' مجاني'];
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(child: HomeAppBar()),
        SliverToBoxAdapter(child: Padding(
          padding:  EdgeInsets.symmetric( vertical: 8.h),
          child: SearchTextField(),
        )),
        SliverToBoxAdapter(
          child: OffersSlider(
            images: images,
            titles: titles,
            descriptions: descriptions,
          ),
        ),
        SliverToBoxAdapter(child: BestSelling()),
        GridViewItemes(),
      ],
    );
  }
}
