import 'package:flutter/material.dart';

import '../../widgets/custom_app_bar.dart';

class ItemsScreen extends StatelessWidget {
  static const String routeName = "/items_screen";

  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomAppBar(
              title: "Search",
              onPressedIcon: () {},
              onPressedSearch: () {},
            ),
          ],
        ),
      ),
    );
  }
}
