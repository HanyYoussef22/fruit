import 'package:fruit/core/helpers/constants.dart';

class ButtonNavigationBarEntity {
  final String activeIcon, inActiveIcon;
 final String text;
  ButtonNavigationBarEntity(
      {required this.text, required this.activeIcon, required this.inActiveIcon});
}

  List<ButtonNavigationBarEntity> get bottomNavigationBarItems => [
        ButtonNavigationBarEntity(
            activeIcon: Assets.homeIcon, inActiveIcon: Assets.homeIconUnslect,text: ' الرئيسية'),

        ButtonNavigationBarEntity(
            activeIcon: Assets.prouductIcon, inActiveIcon: Assets.prouductIconUnslect, text: ' المنتجات'),

        ButtonNavigationBarEntity(
            activeIcon: Assets.cartIcon,
            inActiveIcon: Assets.cartIconUnslect, text: ' سلة التسوق'),

        ButtonNavigationBarEntity(
            activeIcon: Assets.profileIcon,
            inActiveIcon: Assets.profileIconUnslect, text: ' حسابي'),
      ];



