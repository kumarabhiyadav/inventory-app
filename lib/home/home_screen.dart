import 'package:flutter/material.dart';

import 'package:inventory_app/commonWidgets/app_bar.dart';
import 'package:inventory_app/financeModule/screens/report_screen.dart';
import 'package:inventory_app/financeModule/screens/sales_screen.dart';
import 'package:inventory_app/purchaseModule/screens/purchase_screen.dart';
import 'package:inventory_app/purchaseModule/screens/supplier_screen.dart';
import '../InventoryModule/screens/product_screens.dart';
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
        leading: SizedBox.shrink(),
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
              function: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SalesScreen()));
              },
              size: size,
              icon: 'assets/svgs/sales.svg',
              subTitle: 'Insert daily sales',
              title: 'Sales',
            ),
            Options(
              function: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PurchaseScreen()));
              },
              size: size,
              icon: 'assets/svgs/purchase.svg',
              subTitle: 'Purchase history and add purchase',
              title: 'Purchase',
            ),
            Options(
              function: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SupplierScreen()));
              },
              size: size,
              icon: 'assets/svgs/suppliers.svg',
              subTitle: 'Managing Suppliers',
              title: 'Suppliers',
            ),
            Options(
              function: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CategoryScreen()));
              },
              size: size,
              icon: 'assets/svgs/inventory.svg',
              subTitle: 'Manage products',
              title: 'Products',
            ),
            Options(
              function: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReportScreen()));
              },
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
