import 'package:flutter/material.dart';

import 'widgets/best_selling_body.dart';

class BestSelling extends StatelessWidget {
  const BestSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BestSellingBody(),

      ),
    );
  }
}
