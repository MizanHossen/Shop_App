import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:store_app_with_api/consts/api_const.dart';
import 'package:store_app_with_api/models/category_model.dart';

import 'package:store_app_with_api/models/products_model.dart';
import 'package:store_app_with_api/models/users_model.dart';

class APIHandler {
  //static List<ProductModel> productList = [];

  static Future<List<dynamic>> getData({
    required String target,
    String? limit,
  }) async {
    try {
      var uri = Uri.https(
        BASE_URL,
        "api/v1/$target",
        target == "products"
            ? {
                "offset": "0",
                "limit": limit,
              }
            : {},
      );
      var response = await http.get(uri);

      //print("response ${jsonDecode(response.body)}");

      var data = jsonDecode(response.body);

      List tempList = [];

      if (response.statusCode != 200) {
        throw data["message"];
      }

      for (var v in data) {
        tempList.add(v);
      }
      return tempList;
    } catch (error) {
      log("An error occured $error");
      throw error.toString();
    }
  }

  //products

  static Future<List<ProductsModel>> getAllProductApi(
      {required String limit}) async {
    List temp = await getData(target: "products", limit: limit);
    return ProductsModel.productsFromSnapshot(temp);
  }

  //Category = https://api.escuelajs.co/api/v1/categories

  static Future<List<CategoryModel>> getAllCategories() async {
    List temp = await getData(target: "categories");
    return CategoryModel.categoriesFromSnapshot(temp);
  }

  //Users = https://api.escuelajs.co/api/v1/users

  static Future<List<UsersModel>> getAllUsers() async {
    List temp = await getData(target: "users");
    return UsersModel.usersFromSnapshot(temp);
  }

  //single product

  static Future<ProductsModel> getProductById({required String id}) async {
    try {
      var uri = Uri.https(BASE_URL, "api/v1/products/$id");
      var response = await http.get(uri);

      //print("response ${jsonDecode(response.body)}");

      var data = jsonDecode(response.body);

      if (response.statusCode != 200) {
        throw data["message"];
      }

      // List tempList = [];

      return ProductsModel.fromJson(data);
    } catch (error) {
      log("an error occured while getting product info $error");
      throw error.toString();
    }
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
