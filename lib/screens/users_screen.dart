import 'package:flutter/material.dart';

import '../widgets/users_widgets.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

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
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return UsersWidget();
        },
      ),
    );
  }
}
