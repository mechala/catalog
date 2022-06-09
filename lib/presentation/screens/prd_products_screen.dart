import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:products/business_logic/prd_app_colors.dart';
import 'package:products/business_logic/prd_app_screens.dart';
import 'package:products/presentation/screens/prd_base_screen.dart';

import '../models/prd_products_view_model.dart';
import '../widgets/prd_all_product_body.dart';
import '../widgets/prd_favorite_product_body.dart';

class PRDProductsScreen extends StatefulWidget {
  PRDProductsScreen({Key? key}) : super(key: key);

  @override
  State<PRDProductsScreen> createState() => _PRDProductsScreenState();
}

class _PRDProductsScreenState extends State<PRDProductsScreen> {
  @override
  void initState() {
    final model = GetIt.I<PRDProductsViewModel>();
    model.globalContext = context;
    model.pagingController.addPageRequestListener((pageKey) {
      model.getProducts(pageKey);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: PRDBaseScreen<PRDProductsViewModel>(
          content: ((context, child, model) {
        return DefaultTabController(
          length: 2,
          initialIndex: model.tabIndex,
          child: Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(PRDAppScreens.search);
                      },
                      icon: Icon(
                        Icons.search,
                        color: PRDAppColors.deepPurple,
                      ))
                ],
                automaticallyImplyLeading: false,
                bottom: TabBar(
                  tabs: [
                    Tab(
                      child: Text(
                        "All Products",
                        style: TextStyle(color: PRDAppColors.deepPurple),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Favourites",
                        style: TextStyle(color: PRDAppColors.deepPurple),
                      ),
                    ),
                  ],
                ),
                backgroundColor: PRDAppColors.beigeBackground,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 40,
                        width: 40,
                        child: Icon(
                          Icons.shopping_bag_outlined,
                          color: PRDAppColors.deepPurple,
                          size: 40,
                        )),
                    Text(
                      "Catalog",
                      style: Theme.of(context).textTheme.headline1?.copyWith(
                          color: PRDAppColors.deepPurple,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              body: TabBarView(children: [
                PRDAllProductsBody(
                  model: model,
                ),
                PRDFavoriteProductBody()
              ])),
        );
      })),
    );
  }
}
