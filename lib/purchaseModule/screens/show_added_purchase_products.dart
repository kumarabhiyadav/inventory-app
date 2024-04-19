import 'package:flutter/material.dart';
import 'package:inventory_app/InventoryModule/screens/category_screen.dart';
import 'package:inventory_app/commonWidgets/primary_button.dart';
import 'package:inventory_app/home/home_screen.dart';
import 'package:inventory_app/purchaseModule/models/supplier.model.dart';
import 'package:inventory_app/purchaseModule/providers/purchase_provider.dart';
import 'package:inventory_app/purchaseModule/screens/add_purchase_screen.dart';
import 'package:provider/provider.dart';

import '../../commonWidgets/app_bar.dart';
import '../models/purchase.model.dart';

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
    final PurchaseModel? purchaseModel =
        Provider.of<PurchaseProvider>(context).currentPurchaseModel;
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.supplierModel.name,
        leading: Material(
          child: InkWell(
            onTap: () {
              // Navigator.pop(context);
              
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (route) => false);
            },
            splashColor: Colors.purple.withOpacity(.3),
            child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: dW * 0.05, vertical: dW * 0.02),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black12,
                ),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Theme.of(context).primaryColor,
                  size: 18,
                )),
          ),
        ),
      ),
      body: purchaseModel != null
          ? purchaseModel.subProdut.isNotEmpty
              ? Column(children: [
                  ...purchaseModel.subProdut.map((e) => Container(
                        margin: EdgeInsets.symmetric(horizontal: dW * 0.05),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                            height: dW * 0.12,
                            width: dW * 0.12,
                            child: null,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12),
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          title: Text(e.name),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("\u{20B9}${e.cost.toStringAsFixed(2)}"),
                              const Text("X"),
                              Text(e.quantity.toStringAsFixed(2)),
                              const Text("="),
                              Text((e.cost * e.quantity).toStringAsFixed(2)),
                            ],
                          ),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.delete_forever_sharp,
                              color: Colors.red,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ))
                ])
              : null
          : null,
      floatingActionButton: PrimaryButton(
        function: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => AddPurchaseScreen(
          //               supplierModel: widget.supplierModel,
          //             )));
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CategoryScreen()));
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
