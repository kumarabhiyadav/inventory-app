import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:inventory_app/commonWidgets/app_bar.dart';
import 'package:inventory_app/purchaseModule/models/purchase_model.dart';

import '../../colors.dart';

class PurchaseDetailScreen extends StatefulWidget {
  PurchaseDetailScreen({Key? key, required this.purchaseModel})
      : super(key: key);
  final PurchaseModel purchaseModel;

  @override
  State<PurchaseDetailScreen> createState() => _PurchaseDetailScreenState();
}

class _PurchaseDetailScreenState extends State<PurchaseDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final dW = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Purchase Details'),
      body: Container(
        margin: EdgeInsets.all(dW * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Supplier',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      widget.purchaseModel.supplier.name,
                      style: Theme.of(context).textTheme.headline5,
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Date',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      DateFormat('dd MMM yyyy hh:mm a')
                          .format(widget.purchaseModel.date),
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: dW * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Cost',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.purchaseModel
                      .getTotalOfSubProducts()
                      .toStringAsFixed(2),
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontSize: 14),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Extra Cost',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.purchaseModel.additionalCost.toStringAsFixed(2),
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Colors.red.withOpacity(0.7),
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Grand Total',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  (widget.purchaseModel.additionalCost +
                          widget.purchaseModel.getTotalOfSubProducts())
                      .toStringAsFixed(2),
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
            SizedBox(
              height: dW * 0.05,
            ),
            ...widget.purchaseModel.subproducts.map((sub) => Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.8, color: Colors.black12),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(2, 2),
                            spreadRadius: 0.2,
                            blurRadius: .5)
                      ],
                      borderRadius: BorderRadius.circular(8)),
                  margin: EdgeInsets.only(bottom: dW * 0.05),
                  padding: EdgeInsets.all(dW * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                sub.subProduct.name,
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              Text(
                                sub.unit,
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(dW * 0.01),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: Colors.black26, width: .8)),
                            child: sub.image == ''
                                ? SvgPicture.asset(
                                    'assets/svgs/subproduct.svg',
                                    height: 40,
                                    width: 40,
                                    fit: BoxFit.fill,
                                    color: iconColor,
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      sub.image,
                                      height: 40,
                                      width: 40,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.transparent,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Quanity'),
                              Text(sub.quantity.toStringAsFixed(2)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Rate per unit'),
                              Text(
                                  (sub.cost / sub.quantity).toStringAsFixed(2)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text('Cost'),
                              Text(widget.purchaseModel
                                  .rateWithExtraCost(subProduct: sub)
                                  .toStringAsFixed(2)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text('Total'),
                              Text((widget.purchaseModel
                                          .rateWithExtraCost(subProduct: sub) *
                                      sub.quantity)
                                  .toStringAsFixed(2)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
