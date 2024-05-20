import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:inventory_app/commonWidgets/app_bar.dart';
import 'package:inventory_app/commonWidgets/common_functions.dart';
import 'package:inventory_app/purchaseModule/models/purchase.model.dart';

import '../../colors.dart';

class PurchaseDetailScreen extends StatefulWidget {
  const PurchaseDetailScreen({Key? key, required this.purchaseModel})
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
                    SizedBox(
                      width: dW*0.6,
                      child: Text(
                        widget.purchaseModel.supplier.name,
                        style: Theme.of(context).textTheme.headline5,
                      ),
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
                      DateFormat('dd MMM yyyy')
                          .format(widget.purchaseModel.purchaseDate),
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
                  widget.purchaseModel.totalCost.toStringAsFixed(2),
                  // "",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontSize: 14),
                ),
              ],
            ),
            const Divider(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       'Extra Cost',
            //       style: Theme.of(context).textTheme.subtitle1,
            //     ),
            //     const SizedBox(
            //       height: 5,
            //     ),
            //     Text(
            //       // widget.purchaseModel.additionalCost.toStringAsFixed(2),
            //       "",
            //       style: Theme.of(context).textTheme.subtitle2!.copyWith(
            //           color: Colors.red.withOpacity(0.7),
            //           fontWeight: FontWeight.w600),
            //     ),
            //   ],
            // ),
            // const Divider(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       'Grand Total',
            //       style: Theme.of(context).textTheme.subtitle1,
            //     ),
            //     const SizedBox(
            //       height: 5,
            //     ),
            //     Text(
            //       // (widget.purchaseModel.additionalCost +
            //       //         widget.purchaseModel.getTotalOfSubProducts())
            //       //     .toStringAsFixed(2),
            //       "",
            //       style: Theme.of(context).textTheme.headline4,
            //     ),
            //   ],
            // ),
            SizedBox(
              height: dW * 0.05,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  ...widget.purchaseModel.subProducts.map((sub) => Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 0.8, color: Colors.black12),
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
                                    SizedBox(
                                      width: dW*.6,
                                      child: Text(
                                        sub.name,
                                        style:
                                            Theme.of(context).textTheme.headline4,
                                      ),
                                    ),
                                    Text(
                                      sub.unit,
                                      style:
                                          Theme.of(context).textTheme.subtitle2,
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
                                      : GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ShowImage(
                                                            title: sub.name,
                                                            url: sub.image )));
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                              // sub.image,
                                              sub.image,
                                              height: 40,
                                              width: 40,
                                              fit: BoxFit.fill,
                                            ),
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
                                    const Text('Rate per unit'),
                                    Text((sub.cost).toStringAsFixed(2)),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Quanity'),
                                    Text(sub.quantity.toStringAsFixed(2)),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Text('Cost'),
                                    // Text(widget.purchaseModel
                                    //     .rateWithExtraCost(subProduct: sub)
                                    //     .toStringAsFixed(2)),m

                                    Text((sub.quantity * sub.cost)
                                        .toStringAsFixed(2)),
                                  ],
                                ),
                              ],
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('MRP'),
                                    Text(sub.mrp.toStringAsFixed(2)),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('MRP %'),
                                   Text((calculatePercentageDifference(
                                            sub.cost, sub.mrp))
                                        .toStringAsFixed(2))]

                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Selling Price'),
                                    Text((sub.sellingprice).toStringAsFixed(2)),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Text('Selling %'),
                                    Text((calculatePercentageDifference(
                                            sub.cost, sub.sellingprice))
                                        .toStringAsFixed(2)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ShowImage extends StatelessWidget {
  const ShowImage({super.key, required this.url, required this.title});
  final String url;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: title),
        body: Container(
            color: Colors.white, child: Center(child: Image.network(url))));
  }
}
