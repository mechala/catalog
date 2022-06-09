import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:products/presentation/widgets/prd_product_card.dart';

import '../../business_logic/models/prd_product.dart';
import '../models/prd_products_view_model.dart';

class PRDAllProductsBody extends StatelessWidget {
  const PRDAllProductsBody({
    Key? key,
    required this.model,
  }) : super(key: key);
  final PRDProductsViewModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: PagedGridView<int, PRDProduct>(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.8,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
          ),
          pagingController: model.pagingController,
          builderDelegate: PagedChildBuilderDelegate<PRDProduct>(
              itemBuilder: ((context, item, index) =>
                  PRDProductCard(product: item))),
        ),
      ),
    );
  }
}
