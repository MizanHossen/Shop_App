import 'package:flutter/cupertino.dart';

class CategoryModel with ChangeNotifier {
  int? id;
  String? name;
  String? image;

  CategoryModel({this.id, this.name, this.image});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  static List<CategoryModel> categoriesFromSnapshot(List categoriesSnapshot) {
    //print("data ${categoriesSnapshot[0]}");
    return categoriesSnapshot.map((data) {
      return CategoryModel.fromJson(data);
    }).toList();
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   data['image'] = this.image;
  //   return data;
  // }
}
