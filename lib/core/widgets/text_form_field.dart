import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/core/theming/style/colors.dart';
import 'package:fruit/core/theming/style/styles.dart';



class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final IconData? prefixIcon;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;

  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator, this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide:  BorderSide(
                color: ColorsManger.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide:  BorderSide(
                color: ColorsManger.borderGray,
                width: 0.8,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
        hintStyle: hintStyle ?? Styles.font13Grayscale400,
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon:prefixIcon != null ? Icon(prefixIcon) : null,
        fillColor: backgroundColor ?? ColorsManger.lightGray,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      style: Styles.font13Grayscale400,
      validator: (value) {
        return validator(value);
      },
    );
  }
}


