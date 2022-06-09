import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:products/business_logic/prd_app_colors.dart';
import 'package:products/business_logic/prd_app_screens.dart';
import 'package:products/business_logic/prd_products_module.dart';

class PRDSplashScreen extends StatefulWidget {
  PRDSplashScreen({Key? key}) : super(key: key);

  @override
  State<PRDSplashScreen> createState() => _PRDSplashScreenState();
}

class _PRDSplashScreenState extends State<PRDSplashScreen> {
  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      PRDProductsModule.instance.getFavorites();
      Timer(const Duration(seconds: 2),
          () => Navigator.popAndPushNamed(context, PRDAppScreens.products));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Size.infinite.height,
      width: Size.infinite.height,
      color: PRDAppColors.mainBlue,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Row(
            children: [
              Icon(
                Icons.shopping_bag_outlined,
                color: PRDAppColors.productBeigeBackground,
                size: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Catalog",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.w900),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
