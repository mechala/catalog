import 'package:flutter/material.dart';
import 'package:products/business_logic/models/prd_product.dart';
import 'package:products/business_logic/prd_app_colors.dart';
import 'package:products/presentation/screens/prd_product_details_screen.dart';

class PRDProductCard extends StatelessWidget {
  const PRDProductCard(
      {Key? key, required this.product, this.fromSearch = false})
      : super(key: key);
  final PRDProduct product;
  final bool fromSearch;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PRDProductDetailsScreen(
                  product: product,
                  goBack: fromSearch,
                )),
      ),
      child: Container(
        color: PRDAppColors.productBeigeBackground,
        child: Column(
          children: [
            Container(
                height: 100,
                color: Colors.white,
                child: Image.network(
                  product.image,
                  errorBuilder: (context, error, stackTrace) => Center(
                      child: Icon(
                    Icons.shopping_bag_outlined,
                    color: PRDAppColors.deepPurple,
                    size: 100,
                  )),
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  product.category,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$" + product.price.toString().padLeft(3, '0'),
                  style: TextStyle(
                      fontWeight: FontWeight.w100, color: Colors.grey),
                ),
                Text(
                  'Available: ${product.available}',
                  style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.7)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
