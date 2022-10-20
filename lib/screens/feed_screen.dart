import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app_with_api/widgets/feed_widget.dart';

import '../api_services/api_handler.dart';
import '../models/products_model.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  //
  late List<ProductsModel> productList = [];

  @override
  void didChangeDependencies() {
    getProducts();
    super.didChangeDependencies();
  }

  Future<void> getProducts() async {
    productList = await APIHandler.getAllProductApi();
    setState(() {});
  }

  ///

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Products"),
        // leading: AppBarIcons(
        //   function: () {},
        //   icon: Icons.arrow_back_ios,
        // ),
      ),
      body: productList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              //shrinkWrap: true,
              //physics: const NeverScrollableScrollPhysics(),
              itemCount: productList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                  value: productList[index],
                  child: const FeedsWidget(),
                );
              },
            ),
    );
  }
}
