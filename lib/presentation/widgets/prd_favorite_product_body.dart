import 'package:flutter/material.dart';
import 'package:products/presentation/widgets/prd_product_card.dart';

import '../../business_logic/prd_products_module.dart';

class PRDFavoriteProductBody extends StatelessWidget {
  PRDFavoriteProductBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: PRDProductsModule.instance.favoriteProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.8,
          crossAxisSpacing: 5,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
        ),
        itemBuilder: ((context, index) => PRDProductCard(
            product: PRDProductsModule.instance.favoriteProducts[index])));
  }
}
