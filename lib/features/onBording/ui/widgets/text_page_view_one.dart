import 'package:flutter/material.dart';
import 'package:fruit/core/theming/style/styles.dart';

Widget textTitel() {
  return RichText(
    text: TextSpan(children: [
      TextSpan(
        text: 'Fruit',

        style: Styles.font23BlackW700,
      ),
      TextSpan(
        text: 'HUB ',
        style: Styles.font23OrangeW700,
      ),
      TextSpan(
        text: 'مرحبًا بك في ',
        style: Styles.font23BlackW700,
      ),
    ]),
  );
}

Widget textSubTitel() {
  return Text(
    textAlign: TextAlign.center,
    'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية. ',
    style: Styles.font13Grayscale500W600,
  );
}
Widget textSubTitel2() {
  return Text(
    textAlign: TextAlign.center,
    'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
    style: Styles.font13Grayscale500W600,
  );
}
