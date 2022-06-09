import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:products/business_logic/models/prd_product.dart';
import 'package:products/business_logic/prd_products_module.dart';
import 'package:products/data/prd_products_data.dart';
import 'package:products/presentation/models/prd_base_model.dart';

class PRDProductsViewModel extends PRDBaseModel {
  static const _pageSize = 5;
  int tabIndex = 0;
  final PagingController<int, PRDProduct> pagingController =
      PagingController(firstPageKey: 1);

  getProducts(int pageKey) async {
    List<PRDProduct> allProductsList = [];

    try {
      List productsList = await PRDProductsData.instance.getProducts(pageKey);
      for (var product in productsList) {
        allProductsList.add(PRDProduct.fromJson(product));
      }

      final isLastPage =
          productsList.length < _pageSize || productsList.length == 45;
      PRDProductsModule.instance.allProducts += allProductsList;
      if (isLastPage) {
        pagingController.appendLastPage(allProductsList);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(allProductsList, nextPageKey);
      }
    } on Exception catch (e) {
      showMessageString(globalContext, e.toString());
    }
  }
}
