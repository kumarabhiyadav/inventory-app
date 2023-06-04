import 'package:flutter/material.dart';
import 'package:inventory_app/commonWidgets/primary_button.dart';
import 'package:inventory_app/purchaseModule/screens/add_purchase_screen.dart';

import '../../commonWidgets/app_bar.dart';
import '../models/purchase_model.dart';

class ShowAddPurchaseProducts extends StatefulWidget {
  const ShowAddPurchaseProducts({Key? key, required this.supplierModel})
      : super(key: key);
  final SupplierModel supplierModel;

  @override
  State<ShowAddPurchaseProducts> createState() =>
      _ShowAddPurchaseProductsState();
}

class _ShowAddPurchaseProductsState extends State<ShowAddPurchaseProducts> {
  @override
  Widget build(BuildContext context) {
    final dW = MediaQuery.of(context).size.width;
    final dH = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(title: widget.supplierModel.name),
      floatingActionButton: PrimaryButton(
        function: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddPurchaseScreen()));
        },
        height: dW * 0.12,
        width: dW * .9,
        title: "New Product",
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
