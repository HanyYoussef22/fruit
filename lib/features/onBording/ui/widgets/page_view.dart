import 'package:flutter/material.dart';
import 'package:fruit/core/helpers/constants.dart';
import 'package:fruit/features/onBording/ui/widgets/page_view_item.dart';
import 'package:fruit/features/onBording/ui/widgets/text_page_view_one.dart';

import '../../../../core/theming/style/styles.dart';

class ViewPage extends StatelessWidget {
  const ViewPage({super.key, required this.pageController,});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          bgImage: Assets.bgImageOnboarding1,
          image: Assets.imageOnboarding1,
          title: textTitel(),
          subtitle: textSubTitel(), isVisible: true, pageController:  pageController,),
        PageViewItem(
          bgImage: Assets.bgImageOnboarding2,
          image: Assets.imageOnboarding2,
          title: Text(
            'ابحث وتسوق',
            style: Styles.font23BlackW700,
          ),
          subtitle: textSubTitel2(), isVisible: false, pageController: pageController,
        ),
      ],
    );
  }
}
// pageController.hasClients? pageController.page!.round():0) == 1