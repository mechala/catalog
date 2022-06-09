import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:products/business_logic/models/prd_product.dart';
import 'package:products/business_logic/models/prd_string_extension.dart';


void main() {

  testWidgets('parsing product', (WidgetTester tester) async {
    Map<String, dynamic> map = {
      "id": 1,
      "Url": "https://www.wikimedia.org",
      "Name": "Nicholas",
      "Image": "https://logo.clearbit.com/360.cn",
      "Price": 64,
      "Category": "Shoe",
      "Available": 19,
      "Description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    };
    expect(PRDProduct.fromJson(map), isA<PRDProduct>());
  });

  testWidgets('Capitalizing', (WidgetTester tester) async {
    String capitalizeTest = 'test';
    expect(capitalizeTest.capitalize(), 'Test');
  });

}
