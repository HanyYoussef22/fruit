import 'dart:convert';
import 'dart:developer';

import 'package:fruit/core/helpers/shared_perfrance_helper.dart';
import 'package:fruit/features/auth/data/models/user_model.dart';

bool isUserShown = false;
bool isUserLogin = false;



class SharedPrefKeys {
  static const String userToken = 'userToken';
  static const String isOnboardingShown = 'isOnboardingShown';
  static const String isUserLogin = 'isUserLogin';
  static const String kUser = 'userData';
}

class Assets {
  static const String topSplash = "assets/images/svgs/topSplash.svg";
  static const String logoSplash = "assets/images/svgs/logoSplash.svg";
  static const String buttonSplash = "assets/images/svgs/buttonSplash.svg";
  static const String bgImageOnboarding1 =
      "assets/images/svgs/onboarding/bgImage1.svg";
  static const String bgImageOnboarding2 =
      "assets/images/svgs/onboarding/bgImage2.svg";
  static const String imageOnboarding1 =
      "assets/images/svgs/onboarding/fruit1.svg";
  static const String imageOnboarding2 =
      "assets/images/svgs/onboarding/fruit2.svg";
  static const String appleicon = "assets/images/svgs/appleicon.svg";
  static const String googleicon = "assets/images/svgs/googleicon.svg";
  static const String facebookicon = "assets/images/svgs/facebookicon.svg";
  static const String imagesCheck = "assets/images/svgs/imagesCheck.svg";
  static const String profileImage = "assets/images/profile_image.png";
  static const String notification = "assets/images/svgs/home/notification.svg";
  static const String notfiRed = "assets/images/svgs/home/notfRed.svg";
  static const String filtterIcon = "assets/images/svgs/home/filter.svg";
  static const String searchIcon = "assets/images/svgs/home/search_icon.svg";
  static const String slide = "assets/images/svgs/home/slide.svg";
  static const String heart = "assets/images/svgs/home/heart.svg";
  static const String fruitItem = "assets/images/svgs/home/fruitItem.svg";
  static const String homeIcon = "assets/images/svgs/home/icons/home.svg";
  static const String homeIconUnslect =
      "assets/images/svgs/home/icons/home_unslect.svg";
  static const String cartIcon =
      "assets/images/svgs/home/icons/shopping-cart.svg";
  static const String cartIconUnslect =
      "assets/images/svgs/home/icons/icon_cart_unslect.svg";
  static const String prouductIcon =
      "assets/images/svgs/home/icons/products.svg";
  static const String prouductIconUnslect =
      "assets/images/svgs/home/icons/icon_product_unslect.svg";
  static const String profileIcon = "assets/images/svgs/home/icons/user.svg";
  static const String profileIconUnslect =
      "assets/images/svgs/home/icons/icon_profle_unslect.svg";
}

class BackendEndpoint {
  static const String addUserData = 'users';
  static const String getUserData = 'users';
  static const String checkIfDataExist = 'users';
}
