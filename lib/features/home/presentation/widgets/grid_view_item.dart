import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'item_product.dart';

class GridViewItemes extends StatelessWidget {
  const GridViewItemes({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.6,
            mainAxisExtent: MediaQuery.of(context).size.height * 0.34,

            crossAxisCount:2 ,mainAxisSpacing: 10, crossAxisSpacing: 10),
        itemCount: 50,
        itemBuilder: (context,index){
          return ItemProduct();
        }
    );
  }
}
