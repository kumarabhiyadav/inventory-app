import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/purchase_model.dart';
import '../providers/purchase_provider.dart';
import '../screens/add_purchase_screen.dart';
import 'supplier_tile.dart';

class SelectSupplierForPurchase extends StatefulWidget {
  const SelectSupplierForPurchase({Key? key}) : super(key: key);

  @override
  State<SelectSupplierForPurchase> createState() =>
      _SelectSupplierForPurchaseState();
}

class _SelectSupplierForPurchaseState extends State<SelectSupplierForPurchase> {
  @override
  Widget build(BuildContext context) {
    final List<SupplierModel> suppliers =
        Provider.of<PurchaseProvider>(context).suppliers;
    final dW = MediaQuery.of(context).size.width;
    final dH = MediaQuery.of(context).size.height;

    return Container(
      height: dH * 0.9,
      padding: EdgeInsets.only(
        top: dW * 0.1,
      ),
      child: Column(
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
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddPurchaseScreen(
                                supplierModel: suppliers[index],
                              )));
                },
                child: SupplierTile(
                  dW: dW,
                  supplier: suppliers[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
