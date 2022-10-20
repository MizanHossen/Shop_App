import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app_with_api/models/products_model.dart';
import 'package:store_app_with_api/widgets/feed_widget.dart';

class FeedsGridWidget extends StatelessWidget {
  FeedsGridWidget({
    Key? key,
    required this.productList,
    //required this.productList,
  }) : super(key: key);

  final List<ProductsModel> productList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
          value: productList[index],
          child: const FeedsWidget(),
        );
      },
    );
  }
}
