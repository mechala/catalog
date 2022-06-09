import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:products/data/prd_products_data.dart';

import 'models/prd_product.dart';

class PRDProductsModule {
  PRDProductsModule._privateConstructor();
  static final PRDProductsModule instance =
      PRDProductsModule._privateConstructor();

  List<PRDProduct> allProducts = [];
  List<PRDProduct> favoriteProducts = [];

  saveFavorites() {
    List<int> favoritesId = [];
    for (var product in favoriteProducts) {
      favoritesId.add(product.id);
    }
    PRDProductsData.instance.setValue(favoritesId, key: "favorites");
  }

  getFavorites() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    List<int> favoritesId =
        await PRDProductsData.instance.getValue('favorites') as List<int>? ??
            [];

    for (var id in favoritesId) {
      favoriteProducts.add(
          PRDProduct.fromJson(await PRDProductsData.instance.getProduct(id)));
    }
  }
}
