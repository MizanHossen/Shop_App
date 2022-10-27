import 'dart:ffi';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:store_app_with_api/api_services/api_handler.dart';
import 'package:store_app_with_api/consts/global_constants.dart';
import 'package:store_app_with_api/models/products_model.dart';
import 'package:store_app_with_api/screens/category_screen.dart';
import 'package:store_app_with_api/screens/feed_screen.dart';
import 'package:store_app_with_api/screens/users_screen.dart';
import 'package:store_app_with_api/widgets/feed_grid.dart';
import 'package:store_app_with_api/widgets/feed_widget.dart';
import 'package:store_app_with_api/widgets/sale_widget.dart';
import '../widgets/app_bar_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _textEditingController = TextEditingController();

  //late List<ProductsModel> productList = [];

  // @override
  // void didChangeDependencies() {
  //   getProducts();
  //   super.didChangeDependencies();
  // }

  // Future<void> getProducts() async {
  //   productList = await APIHandler.getAllProductApi();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          leading: AppBarIcons(
            function: () {
              Navigator.push(
                context,
                PageTransition(
                  child: const CategoryScreen(),
                  type: PageTransitionType.leftToRight,
                ),
              );
            },
            icon: IconlyBold.category,
          ),
          actions: [
            AppBarIcons(
              function: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: const UsersScreen(),
                    type: PageTransitionType.rightToLeft,
                  ),
                );
              },
              icon: IconlyBold.user3,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  hintText: "Search",
                  filled: true,
                  fillColor: Theme.of(context).canvasColor,
                  suffixIcon: Icon(
                    IconlyLight.search,
                    color: lightIconsColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Theme.of(context).cardColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        width: 1,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      SizedBox(
                        height: size.height * 0.25,
                        child: Swiper(
                          autoplay: true,
                          itemCount: 5,
                          //scontrol: const SwiperControl(),
                          pagination: const SwiperPagination(
                            alignment: Alignment.bottomCenter,
                            builder: DotSwiperPaginationBuilder(
                              color: Colors.white,
                              activeColor: Colors.red,
                            ),
                          ),
                          itemBuilder: (context, index) {
                            return const SaleWidget();
                          },
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text(
                              "Latest Products",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            const Spacer(),
                            AppBarIcons(
                                function: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: const FeedScreen(),
                                    ),
                                  );
                                },
                                icon: IconlyBold.arrowRight2),
                          ],
                        ),
                      ),
                      FutureBuilder<List<ProductsModel>>(
                        future: APIHandler.getAllProductApi(),
                        builder: ((context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
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
                          return FeedsGridWidget(
                            productList: snapshot.data!,
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
