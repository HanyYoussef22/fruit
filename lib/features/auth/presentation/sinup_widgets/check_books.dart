import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit/core/theming/style/colors.dart';
import '../../../../../core/theming/style/styles.dart';
import '../../../../../core/widgets/custom_check_box.dart';

class CheckBooks extends StatefulWidget {
  const CheckBooks({super.key, required this.onChecked});

  final ValueChanged<bool> onChecked;

  @override
  State<CheckBooks> createState() => _CheckBooksState();
}

class _CheckBooksState extends State<CheckBooks> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCheckBox(
          onChecked: (value) {
            isCheck = value;
            widget.onChecked(value);
            setState(() {});
          },
          isChecked: isCheck,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                  style: Styles.font13Grayscale500W600,
                ),
                TextSpan(
                  text: ' الشروط والأحكام الخاصة بنا',
                  style: Styles.font13green600Color,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // navigate to desired screen
                    },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
