import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app_with_api/widgets/feed_widget.dart';

import '../api_services/api_handler.dart';
import '../consts/global_constants.dart';
import '../models/products_model.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  //
  final ScrollController _scrollController = ScrollController();
  late List<ProductsModel> productList = [];

  int limit = 10;
  //bool _isLoading = false;
  bool _isLimit = false;

  @override
  void initState() {
    getProducts();
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   getProducts();
  //   super.didChangeDependencies();
  // }

  Future<void> getProducts() async {
    productList = await APIHandler.getAllProductApi(limit: limit.toString());
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _isLoading = true;
        limit += 10;
        log("limit $limit");
        if (limit == 200) {
          _isLimit = true;
          setState(() {});
          return;
        }
        await getProducts();
        //_isLoading = false;
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
          ? Center(
              child: CircularProgressIndicator(
                color: lightIconsColor,
              ),
            )
          : SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: productList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                  if (!_isLimit)
                    Center(
                        child: CircularProgressIndicator(
                      color: lightIconsColor,
                    ))
                ],
              ),
            ),
    );
  }
}
