import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../InventoryModule/providers/inventory_provider.dart';
import 'sub_product_tile.dart';

class AddProductForPurchase extends StatefulWidget {
  const AddProductForPurchase({Key? key}) : super(key: key);

  @override
  State<AddProductForPurchase> createState() => _AddProductForPurchaseState();
}

class _AddProductForPurchaseState extends State<AddProductForPurchase> {
  @override
  Widget build(BuildContext context) {
    final dH = MediaQuery.of(context).size.height;
    final dW = MediaQuery.of(context).size.width;

    return SizedBox(
      height: dH * 0.8,
    );
  }
}
