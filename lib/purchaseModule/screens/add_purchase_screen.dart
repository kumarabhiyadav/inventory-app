import 'package:flutter/material.dart';
import 'package:inventory_app/commonWidgets/app_bar.dart';
import 'package:inventory_app/purchaseModule/models/purchase_model.dart';

class AddPurchaseScreen extends StatefulWidget {
  const AddPurchaseScreen({Key? key, required this.supplierModel})
      : super(key: key);
  final SupplierModel supplierModel;

  @override
  State<AddPurchaseScreen> createState() => _AddPurchaseScreenState();
}

class _AddPurchaseScreenState extends State<AddPurchaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.supplierModel.name),
    );
  }
}
