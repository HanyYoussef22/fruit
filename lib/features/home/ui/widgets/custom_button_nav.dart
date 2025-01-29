import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit/core/theming/style/colors.dart';
import 'package:fruit/core/theming/style/styles.dart';

import '../../domain/entites/buttom_navigation_bar_entity.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 70,
      decoration: BoxDecoration(
        color: ColorsManger.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: ColorsManger.greyColor.withOpacity(0.05),
            blurStyle: BlurStyle.solid,
            blurRadius: 30,
            offset: Offset(0, -2), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: bottomNavigationBarItems.asMap().entries.map(
              (e) {
            var index = e.key;
            var entity = e.value;
            return Expanded(
              flex: index == currentIndex ? 3 : 2,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                  });
                },
                child: NaivgationBarItem(
                  isSelected: currentIndex == index,
                  buttonNavigationBarEntity: entity,
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}

class NaivgationBarItem extends StatelessWidget {
  const NaivgationBarItem({super.key, required this.isSelected, required this.buttonNavigationBarEntity});
  final bool isSelected;
  final ButtonNavigationBarEntity buttonNavigationBarEntity;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(icon: buttonNavigationBarEntity.activeIcon, text: buttonNavigationBarEntity.text)
        : InActiveItem(icon: buttonNavigationBarEntity.inActiveIcon);
  }
}

class InActiveItem extends StatelessWidget {
  const InActiveItem({super.key, required this.icon});
  final String icon;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(icon);
  }
}

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.icon, required this.text});
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(left: 16.w),
        decoration: BoxDecoration(
          color: ColorsManger.lightGray,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TweenAnimationBuilder<double>(
              duration: Duration(milliseconds: 200),
              tween: Tween(begin: 30.0, end: 35.0), // تكبير الأيقونة عند التحديد
              builder: (context, size, child) {
                return Container(
                  width: size.w,
                  height: size.h,
                  decoration: BoxDecoration(
                    color: ColorsManger.primaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: SvgPicture.asset(icon),
                  ),
                );
              },
            ),
            SizedBox(width: 8.w),
            Text(text, style: Styles.font11SemiBold)
          ],
        ),
      ),
    );
  }
}
