import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_app_with_api/consts/global_constants.dart';

class UsersWidget extends StatelessWidget {
  const UsersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListTile(
      leading: FancyShimmerImage(
        height: size.height * 0.15,
        width: size.width * 0.15,
        errorWidget: const Icon(
          IconlyBold.danger,
          color: Colors.red,
          size: 28,
        ),
        imageUrl: "https://placeimg.com/640/480/any",
      ),
      title: const Text("User name"),
      subtitle: const Text("Email@gmail.com"),
      trailing: Text(
        "User role",
        style: subtitleStyle.copyWith(
          color: lightIconsColor,
        ),
      ),
    );
  }
}
