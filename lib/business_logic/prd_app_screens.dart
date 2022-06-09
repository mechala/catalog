// import 'package:connect_flutter/questions_module/presentation/screens/rf_dashboard_tax_breaks_screen.dart';

import 'package:flutter/material.dart';
import 'package:products/presentation/screens/prd_search_screen.dart';
import '../presentation/screens/prd_splash_screen.dart';

import '../presentation/screens/prd_products_screen.dart';

typedef Widget PRDRouteBuilder(
  BuildContext context,
);

class PRDAppScreens {
  static const String splash = '/splash';
  static const String products = '/products';
  static const String search = '/search';

  static Map<String, PRDRouteBuilder> allRoutes(
    BuildContext context,
  ) =>
      {
        PRDAppScreens.splash: (
          context,
        ) =>
            PRDSplashScreen(),
        PRDAppScreens.products: ((context) => PRDProductsScreen()),
        PRDAppScreens.search: ((context) => PRDSearchcreen())
      };
}
