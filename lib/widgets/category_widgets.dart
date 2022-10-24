import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store_app_with_api/consts/global_constants.dart';
import 'package:store_app_with_api/models/category_model.dart';

class CategoryWidgets extends StatelessWidget {
  const CategoryWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryModel categoryModelProvider =
        Provider.of<CategoryModel>(context);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(10),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: FancyShimmerImage(
              height: size.height * 0.45,
              width: size.width,
              errorWidget: const Icon(
                IconlyBold.danger,
                color: Colors.red,
                size: 28,
              ),
              imageUrl: categoryModelProvider.image.toString(),
              boxFit: BoxFit.fill,
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                categoryModelProvider.name.toString(),
                textAlign: TextAlign.center,
                style: titleStyle.copyWith(
                  backgroundColor: lightCardColor.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
