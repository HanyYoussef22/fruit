import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../helpers/constants.dart';
import '../theming/style/colors.dart';
import '../theming/style/styles.dart';


class SearchTextField extends StatelessWidget {
  final TextEditingController? controller;
  const SearchTextField({super.key, this.controller});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 9,
              offset: Offset(0, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            prefixIcon: SizedBox(
              width: 20,
              child: Center(
                child: SvgPicture.asset(Assets.searchIcon),
              ),
            ),
            suffixIcon: SizedBox(
              width: 20,
              child: Center(
                child: SvgPicture.asset(
                  Assets.filtterIcon,
                ),
              ),
            ),
            hintStyle: Styles.font16Regular,
            hintText: 'ابحث عن.......',
            filled: true,
            fillColor: Colors.white,
            border: buildBorder(),
            enabledBorder: buildBorderUnFocuse(),
            focusedBorder: buildBorder(),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        width: 1.3,
        color: ColorsManger.primaryColor,
      ),
    );
  }

OutlineInputBorder buildBorderUnFocuse() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: const BorderSide(
      width: 1.3,
      color: ColorsManger.whiteColor,
    ),
  );

}
}