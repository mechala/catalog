import 'package:products/business_logic/models/prd_product.dart';
import 'package:products/business_logic/prd_products_module.dart';
import 'package:products/presentation/models/prd_base_model.dart';
import 'package:url_launcher/url_launcher.dart';

class PRDProductDetailsViewModel extends PRDBaseModel {
  bool isFavorite = true;

  checkFavorite(PRDProduct product) {
    isFavorite = PRDProductsModule.instance.favoriteProducts.contains(product);
  }

  void openWebsite(String url) async {
    launchUrl(Uri.parse(url));
  }

  void switchFavorite(PRDProduct product) {
    isFavorite = !isFavorite;
    if (isFavorite) {
      showMessageString(globalContext, 'Added to favorites');
      PRDProductsModule.instance.favoriteProducts.add(product);
    } else {
      showMessageString(globalContext, 'Removed from favorites');
      PRDProductsModule.instance.favoriteProducts
          .removeWhere((element) => element.id == product.id);
    }
    PRDProductsModule.instance.saveFavorites();

    notifyListeners();
  }
}
