import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit/core/helpers/constants.dart';
import 'package:fruit/core/helpers/shared_perfrance_helper.dart';
import 'package:fruit/core/theming/style/styles.dart';
import '../../../../core/helpers/get_user.dart';
import '../../../../core/theming/style/colors.dart';
import '../../../auth/data/models/user_model.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildProfileSection(),
          _buildNotificationIcon(),
        ],
      ),
    );
  }

  Widget _buildProfileSection() {
    UserModel user = getUser();
    return Row(
      children: [
        SizedBox(
          width: 44.w,
          height: 44.h,
          child: Image.asset(Assets.profileImage),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            welcomeText(),
            Text(
              user.name,

              style: Styles.font16BlackW300,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNotificationIcon() {
    return CircleAvatar(
      radius: 25.r,
      backgroundColor: ColorsManger.lightGreen,
      child: Stack(
        children: [
          SvgPicture.asset(Assets.notification),
          Positioned(
            right: 6.5,
            top: 0,
            child: SvgPicture.asset(Assets.notfiRed),
          ),
        ],
      ),
    );
  }
}



Widget  welcomeText () {
    String greetingMessage = _getGreetingMessage();

    return Text(
      greetingMessage,
      style: Styles.font16GrayscaleW400,
    );
  }

  String _getGreetingMessage() {
    final int hour = DateTime.now().hour;

    if (hour < 12) {
      return 'صباح الخير!...';
    } else if (hour >= 12) {
      return 'مساء الخير!...';
    } else {
      return 'صباح الخير!...';
    }
  }

