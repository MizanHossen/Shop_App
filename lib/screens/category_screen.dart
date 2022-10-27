import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app_with_api/models/category_model.dart';
import 'package:store_app_with_api/widgets/category_widgets.dart';

import '../api_services/api_handler.dart';
import '../consts/global_constants.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Category"),
        // leading: AppBarIcons(
        //   function: () {},
        //   icon: Icons.arrow_back_ios,
        // ),
      ),
      body: FutureBuilder<List<CategoryModel>>(
        future: APIHandler.getAllCategories(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: lightIconsColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("An error ${snapshot.error}"),
            );
          } else if (snapshot.data == null) {
            return const Center(
              child: Text("No products"),
            );
          }
          return GridView.builder(
            shrinkWrap: true,
            //physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 1.2,
            ),
            itemBuilder: (context, index) {
              return ChangeNotifierProvider.value(
                value: snapshot.data![index],
                child: const CategoryWidgets(),
              );
            },
          );
        }),
      ),
    );
  }
}
