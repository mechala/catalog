import 'package:products/business_logic/models/prd_product.dart';
import 'package:products/business_logic/prd_products_module.dart';
import 'package:products/presentation/models/prd_base_model.dart';

import '../../data/prd_products_data.dart';

class PRDSearchViewModel extends PRDBaseModel {
  List<PRDProduct> currentProducts = [];
  List<PRDProduct> allProducts = [];

  getAllProducts() async {
    if (allProducts.isNotEmpty) {
      currentProducts = allProducts;
      return;
    }
    showBusy(globalContext, true);
    await PRDProductsData.instance.getProducts(0, limit: 50).then((value) {
      for (var product in value) {
        currentProducts.add(PRDProduct.fromJson(product));
      }
      allProducts = currentProducts;
      showBusy(globalContext, false);
      notifyListeners();
    }).catchError((e) {
      showBusy(globalContext, false);
      showMessageString(globalContext, 'error getting products');
    });
  }

  searchProducts(String value) {
    if (value.isEmpty) {
      currentProducts = allProducts;
      notifyListeners();
      return;
    }
    currentProducts = allProducts.where((element) {
      if (element.category.toLowerCase().contains(value.toLowerCase())) {
        return true;
      }
      if (element.name.toLowerCase().contains(value.toLowerCase())) {
        return true;
      }
      return false;
    }).toList();
    notifyListeners();
  }
}
