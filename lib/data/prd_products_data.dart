import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class PRDProductsData {
  PRDProductsData._privateConstructor();
  static final PRDProductsData instance = PRDProductsData._privateConstructor();

  Future<List<dynamic>> getProducts(int page, {int limit = 5}) async {
    String endpoint =
        'https://api-generator.retool.com/wCeTQ3/fakeStore?_page=$page&_limit=$limit';

    http.Client httpClient = http.Client();
    Uri uri = Uri.parse(endpoint);
    final response = await httpClient.get(uri);
    if (response.body == "Not Found") {
      throw '$page product not Found';
    }

    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> getProduct(int id) async {
    String endpoint = 'https://api-generator.retool.com/wCeTQ3/fakeStore/$id';

    http.Client httpClient = http.Client();
    Uri uri = Uri.parse(endpoint);
    final response = await httpClient.get(uri);
    if (response.body == "Not Found") {
      throw '$id product not Found';
    }

    return jsonDecode(response.body);
  }

  Future<dynamic> getValue(String key) {
    return Hive.openBox('products').then((box) {
      return box.get(key);
    });
  }

  Future<dynamic> setValue(dynamic value, {required String key}) {
    return Hive.openBox('products').then((box) {
      return box.put(key, value);
    });
  }
}
