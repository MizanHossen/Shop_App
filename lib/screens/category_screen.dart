import 'package:flutter/material.dart';
import 'package:store_app_with_api/widgets/category_widgets.dart';

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
      body: GridView.builder(
        shrinkWrap: true,
        //physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 1.2,
        ),
        itemBuilder: (context, index) {
          return const CategoryWidgets();
        },
      ),
    );
  }
}
