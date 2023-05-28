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
    final dW = MediaQuery.of(context).size.width;

    final List<PurchaseModel> purchases =
        Provider.of<PurchaseProvider>(context).purchase;
    return Scaffold(
      appBar: const CustomAppBar(title: 'Purchases'),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: dW * 0.05),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black12),
                borderRadius: BorderRadius.circular(5)),
            padding: EdgeInsets.all(dW * 0.02),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(child: Text(purchases[0].supplier.name)),
                    Text(purchases[0].date.toIso8601String()),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    SizedBox(
                      width: dW * 0.22,
                      child: const Text(
                        'Name',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      width: dW * 0.21,
                      child: const Text(
                        'Quantity',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      width: dW * 0.22,
                      child: const Text(
                        'Rate',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      width: dW * 0.2,
                      child: const Text(
                        'Total',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                Divider(),
                ...purchases[0].subproducts.map(
                      (subProduct) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: dW * 0.22,
                            child: Text(
                              subProduct.subProduct.name,
                            ),
                          ),
                          SizedBox(
                            width: dW * 0.21,
                            child: Text(
                              subProduct.quantity.toString(),
                            ),
                          ),
                          SizedBox(
                            width: dW * 0.22,
                            child: Text(
                              (subProduct.cost / subProduct.quantity)
                                  .toStringAsFixed(2),
                            ),
                          ),
                          SizedBox(
                            width: dW * 0.2,
                            child: Text(
                              subProduct.cost.toString(),
                            ),
                          )
                        ],
                      ),
                    ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
