import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:store_app_with_api/consts/global_constants.dart';
import 'package:store_app_with_api/models/products_model.dart';
import 'package:store_app_with_api/screens/product_details.dart';

class FeedsWidget extends StatelessWidget {
  const FeedsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ProductsModel productsModelProvider =
        Provider.of<ProductsModel>(context);
    Size size = MediaQuery.of(context).size;
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: Theme.of(context).cardColor,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              child: const ProductDetails(),
              type: PageTransitionType.fade,
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                        text: "\$",
                        style: const TextStyle(
                          color: Color.fromRGBO(33, 150, 243, 1),
                        ),
                        children: [
                          TextSpan(
                            text: productsModelProvider.price.toString(),
                            style: TextStyle(color: lightTextColor),
                          )
                        ],
                      ),
                    ),
                  ),
                  //const Spacer(),
                  const Icon(IconlyBold.heart),
                  //const SizedBox(height: 10),
                ],
              ),
            ),
            SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FancyShimmerImage(
                height: size.height * 0.2,
                width: double.infinity,
                errorWidget: const Icon(
                  IconlyBold.danger,
                  color: Colors.red,
                  size: 28,
                ),
                imageUrl: productsModelProvider.images![0],
                boxFit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                productsModelProvider.title.toString(),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 17,
                  //  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
