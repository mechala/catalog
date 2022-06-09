import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:products/presentation/models/prd_product_details_view_model.dart';
import 'package:products/presentation/models/prd_products_view_model.dart';
import 'package:products/presentation/models/prd_search_view_model.dart';

import 'business_logic/prd_app_screens.dart';

GetIt locator = GetIt.instance;
Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  setupLocator() {
    locator.registerSingleton(PRDProductsViewModel());
    locator.registerSingleton(PRDProductDetailsViewModel());
    locator.registerSingleton(PRDSearchViewModel());
  }

  @override
  void initState() {
    super.initState();
    setupLocator();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catalog',
      initialRoute: PRDAppScreens.splash,
      routes: PRDAppScreens.allRoutes(context),
      theme: ThemeData(
        fontFamily: GoogleFonts.notoSans().fontFamily,
        textTheme: const TextTheme(
            subtitle1: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                color: Colors.white),
            button: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.white)),
      ),
    );
  }
}
