import 'package:flutter/material.dart';

import '../../../home/presentation/widgets/item_product.dart';

class ItemBestSelling extends StatelessWidget {
  const ItemBestSelling({super.key});

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