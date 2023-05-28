import 'package:flutter/material.dart';
import 'package:inventory_app/commonWidgets/app_bar.dart';
import 'package:inventory_app/purchaseModule/models/purchase_model.dart';
import 'package:inventory_app/purchaseModule/providers/purchase_provider.dart';
import 'package:provider/provider.dart';

class PurchaseScreen extends StatefulWidget {
  const PurchaseScreen({Key? key}) : super(key: key);

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  @override
  Widget build(BuildContext context) {
    final List<PurchaseModel> purchases =
        Provider.of<PurchaseProvider>(context).purchase;
    return Scaffold(
      appBar: const CustomAppBar(title: 'Purchases'),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [Text(purchases[0].supplier.name)],
            ),
          )
        ],
      ),
    );
  }
}
