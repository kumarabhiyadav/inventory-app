import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:inventory_app/commonWidgets/app_bar.dart';
import 'package:inventory_app/purchaseModule/models/purchase_model.dart';
import 'package:inventory_app/purchaseModule/widget/supplier_tile.dart';
import 'package:provider/provider.dart';

import '../providers/purchase_provider.dart';

class SupplierScreen extends StatefulWidget {
  const SupplierScreen({Key? key}) : super(key: key);

  @override
  State<SupplierScreen> createState() => _SupplierScreenState();
}

class _SupplierScreenState extends State<SupplierScreen> {
  @override
  Widget build(BuildContext context) {
    final dW = MediaQuery.of(context).size.width;

    final List<SupplierModel> suppliers =
        Provider.of<PurchaseProvider>(context).suppliers;
    return Scaffold(
      appBar: const CustomAppBar(title: 'Suppliers'),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: dW * 0.05),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: TextFormField(
                decoration: const InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    fillColor: Colors.black12,
                    focusColor: Colors.grey,
                    filled: true,
                    hintText: "Search supplier..."),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: dW * 0.05),
              itemCount: suppliers.length,
              itemBuilder: (context, index) => SupplierTile(
                dW: dW,
                supplier: suppliers[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
