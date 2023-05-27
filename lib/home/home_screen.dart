import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inventory_app/colors.dart';
import 'package:inventory_app/commonWidgets/app_bar.dart';
import 'package:inventory_app/commonWidgets/name_tile.dart';
import 'package:inventory_app/productModule/screens/product_screen.dart';

import '../commonWidgets/options.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const CustomAppBar(
        leading: null,
        title: 'S. S Fashion',
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, vertical: size.width * 0.05),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: [
            Options(
              function: () {},
              size: size,
              icon: 'assets/svgs/sales.svg',
              subTitle: 'Insert daily sales',
              title: 'Sales',
            ),
            Options(
              function: () {},
              size: size,
              icon: 'assets/svgs/purchase.svg',
              subTitle: 'Purchase history and add purchase',
              title: 'Purchase',
            ),
            Options(
              function: () {},
              size: size,
              icon: 'assets/svgs/suppliers.svg',
              subTitle: 'Managing Suppliers',
              title: 'Suppliers',
            ),
            Options(
              function: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProductScreen()));
              },
              size: size,
              icon: 'assets/svgs/inventory.svg',
              subTitle: 'Manage products',
              title: 'Products',
            ),
            Options(
              function: () {},
              size: size,
              icon: 'assets/svgs/reports.svg',
              subTitle: 'Generate excel reports',
              title: 'Reports',
            ),
          ],
        ),
      ),
    );
  }
}
