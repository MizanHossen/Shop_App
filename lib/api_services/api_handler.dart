import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app_with_api/consts/api_const.dart';

import 'package:store_app_with_api/models/products_model.dart';

class APIHandler {
  //static List<ProductModel> productList = [];
  static Future<List<ProductsModel>> getAllProductApi() async {
    var uri = Uri.https(BASE_URL, "api/v1/products");
    var response = await http.get(uri);

    //print("response ${jsonDecode(response.body)}");

    var data = jsonDecode(response.body);

    List tempList = [];

    for (var v in data) {
      tempList.add(v);
    }
    return ProductsModel.productsFromSnapshot(tempList);
  }
}