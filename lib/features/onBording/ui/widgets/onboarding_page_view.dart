import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/core/helpers/extenation.dart';
import 'package:fruit/core/helpers/shared_perfrance_helper.dart';
import 'package:fruit/core/routing/routes.dart';
import 'package:fruit/core/theming/style/colors.dart';
import 'package:fruit/core/widgets/custom_button.dart';
import 'package:fruit/features/onBording/ui/widgets/page_view.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/theming/style/styles.dart';

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({super.key});

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  late PageController pageController;
  var currentPage=0;
  @override
  void initState() {
    pageController=PageController();
    pageController.addListener((){
      currentPage=pageController.page!.round();
      setState(() {

      });
    }
    );
    super.initState();
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Expanded(
          child: ViewPage(pageController: pageController,),
        ),
        DotsIndicator(dotsCount: 2,
          decorator: DotsDecorator(
            color: currentPage==0 ? ColorsManger.primaryColor.withOpacity(0.5):ColorsManger.primaryColor,
            activeColor: ColorsManger.primaryColor,
          ),
        ),
        SizedBox(
          height: 29.h,
        ),
        Visibility(
          visible: currentPage==0 ? false:true,
          maintainAnimation: true,
          maintainState: true,
          maintainSize: true,
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
            child: customButton(text: "ابدأ الان", onTap:(){
              SharedPrefHelper.setData(SharedPrefKeys.isOnboardingShown, true);
                  context.pushReplacementNamed(Routers.loginScreen);
            } ),

          ),
        ),

        SizedBox(
          height: 43.h,
        ),
      ],
    );
  }
}
