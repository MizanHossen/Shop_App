import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app_with_api/consts/api_const.dart';
import 'package:store_app_with_api/models/category_model.dart';

import 'package:store_app_with_api/models/products_model.dart';

class APIHandler {
  //static List<ProductModel> productList = [];

  static Future<List<dynamic>> getData({required String target}) async {
    var uri = Uri.https(BASE_URL, "api/v1/$target");
    var response = await http.get(uri);

    //print("response ${jsonDecode(response.body)}");

    var data = jsonDecode(response.body);

    List tempList = [];

    for (var v in data) {
      tempList.add(v);
    }
    return tempList;
  }

  //products

  static Future<List<ProductsModel>> getAllProductApi() async {
    List temp = await getData(target: "products");
    return ProductsModel.productsFromSnapshot(temp);
  }

  //Category

  //https://api.escuelajs.co/api/v1/categories

  static Future<List<CategoryModel>> getAllCategories() async {
    List temp = await getData(target: "categories");
    return CategoryModel.categoriesFromSnapshot(temp);
  }
}


























//demo api call
 //Category

  //https://api.escuelajs.co/api/v1/categories

  // static Future<List<CategoryModel>> getAllCategories() async {
  //   var uri = Uri.https(BASE_URL, "api/v1/categories");
  //   var response = await http.get(uri);

  //   //print("response ${jsonDecode(response.body)}");

  //   var data = jsonDecode(response.body);

  //   List tempList = [];

  //   for (var v in data) {
  //     tempList.add(v);
  //   }
  //   return CategoryModel.categoriesFromSnapshot(tempList);
  // }
