import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inventory_app/commonWidgets/app_bar.dart';
import 'package:inventory_app/purchaseModule/models/purchase.model.dart';
import 'package:inventory_app/purchaseModule/providers/purchase_provider.dart';
import 'package:inventory_app/purchaseModule/screens/purhcase_detail_screen.dart';
import 'package:inventory_app/purchaseModule/widget/select__supplier_for_purchase.dart';
import 'package:provider/provider.dart';

class PurchaseScreen extends StatefulWidget {
  const PurchaseScreen({Key? key}) : super(key: key);

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  myInit() async {
    await Provider.of<PurchaseProvider>(context, listen: false)
        .fetchPurchases();
  }

  @override
  void initState() {
    myInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dW = MediaQuery.of(context).size.width;

    final List<PurchaseModel> purchases =
        Provider.of<PurchaseProvider>(context).purchase;
    return Scaffold(
      appBar: const CustomAppBar(title: 'Purchases'),
      body: ListView.separated(
        separatorBuilder: ((context, index) => const Divider(
              color: Colors.transparent,
            )),
        itemCount: purchases.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PurchaseDetailScreen(
                          purchaseModel: purchases[index],
                        )));
          },
          onLongPress: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text(
                        "Delete this purchase",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.red),
                      ),
                      content: Text(
                          "Do want to delete purchase from ${purchases[index].supplier.name}"),
                      actions: [
                        TextButton(
                            onPressed: () async {
                              await Provider.of<PurchaseProvider>(context,
                                      listen: false)
                                  .deletePurchase(purchases[index].id);

                              Navigator.pop(context);
                            },
                            child: Text(
                              "Yes",
                              softWrap: true,
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("No")),
                      ],
                    ));
          },
          child: PurchaseWidget(dW: dW, purchases: purchases[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => const SelectSupplierForPurchase())
                .then((value) {
              if (value != null) {}
            });
          },
          icon: const Icon(Icons.add),
          label: Text(
            'Add new purchase',
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
          )),
    );
  }
}

class PurchaseWidget extends StatelessWidget {
  const PurchaseWidget({
    super.key,
    required this.dW,
    required this.purchases,
  });

  final double dW;
  final PurchaseModel purchases;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: dW * 0.05),
      padding: EdgeInsets.all(dW * 0.01),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color.fromARGB(255, 186, 197, 207))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                purchases.supplier.name,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w800),
              ),
              Text(
                DateFormat('dd MMM yyyy').format(purchases.purchaseDate),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w600),
              )
            ],
          ),
          SizedBox(
            height: dW * 0.01,
          ),
          Container(
            width: double.infinity,
            child: Wrap(
              spacing: 10,
              children: [
                ...purchases.subProducts.map((e) => Container(
                    padding: EdgeInsets.all(dW * 0.01),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      "${e.name} (${e.quantity.toStringAsFixed(0)})",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.white),
                    )))
              ],
            ),
          )

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Text(
          //       e.name,
          //       style: Theme.of(context)
          //           .textTheme
          //           .bodyMedium!
          //           .copyWith(fontWeight: FontWeight.w800),
          //     ),
          //     Text(
          //       e.cost.toStringAsFixed(2),
          //       style: Theme.of(context)
          //           .textTheme
          //           .bodySmall!
          //           .copyWith(fontWeight: FontWeight.w600),
          //     ),
          //     Text(
          //       'X',
          //       style: Theme.of(context)
          //           .textTheme
          //           .bodySmall!
          //           .copyWith(fontWeight: FontWeight.w600),
          //     ),
          //     Text(
          //       e.quantity.toStringAsFixed(0),
          //       style: Theme.of(context)
          //           .textTheme
          //           .bodySmall!
          //           .copyWith(fontWeight: FontWeight.w600),
          //     ),
          //     Text(
          //       // e.quantity.toStringAsFixed(0),

          //       (e.cost * e.quantity).toStringAsFixed(2),
          //       style: Theme.of(context)
          //           .textTheme
          //           .bodySmall!
          //           .copyWith(fontWeight: FontWeight.w600),
          //     ),
          //   ],
          // ),
          // )
          // .toList(),
          ,
          SizedBox(
            height: dW * 0.025,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: Theme.of(context).textTheme.bodyLarge!,
              ),
              Text(
                purchases.totalCost.toStringAsFixed(2),
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.blue),
              )
            ],
          )
        ],
      ),
    );
    // return Container(
    //   margin: EdgeInsets.symmetric(horizontal: dW * 0.05),
    //   decoration: BoxDecoration(
    //       border: Border.all(width: 1, color: Colors.black12),
    //       borderRadius: BorderRadius.circular(5)),
    //   padding: EdgeInsets.all(dW * 0.02),
    //   child: Column(
    //     children: [
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           SizedBox(child: Text(purchases[0].supplier.name)),
    //           Text(DateFormat('dd MMM yyyy hh:mm a')
    //               .format(purchases[0].purchaseDate)),
    //         ],
    //       ),
    //       const Divider(),
    //       SizedBox(
    //         width: double.infinity,
    //         child: DataTable(
    //           columnSpacing: 20,
    //           horizontalMargin: 0.0,
    //           headingRowHeight: 40,
    //           dataRowHeight: 40,
    //           columns: const <DataColumn>[
    //             DataColumn(
    //               label: Expanded(
    //                 child: Text(
    //                   'Name',
    //                   style: TextStyle(fontWeight: FontWeight.w700),
    //                 ),
    //               ),
    //             ),
    //             DataColumn(
    //               label: Expanded(
    //                 child: Text(
    //                   'Qyt',
    //                   style: TextStyle(fontWeight: FontWeight.w700),
    //                 ),
    //               ),
    //             ),
    //             DataColumn(
    //               label: Expanded(
    //                 child: Text(
    //                   'Rate',
    //                   style: TextStyle(fontWeight: FontWeight.w700),
    //                 ),
    //               ),
    //             ),
    //             DataColumn(
    //               label: Expanded(
    //                 child: Text(
    //                   'Total',
    //                   style: TextStyle(fontWeight: FontWeight.w700),
    //                 ),
    //               ),
    //             ),
    //           ],
    //           rows: <DataRow>[
    //             ...purchases[0].subProducts.map(
    //                   (sub) => DataRow(
    //                     cells: <DataCell>[
    //                       DataCell(Text(sub.name)),
    //                       DataCell(
    //                           Text(sub.quantity.toStringAsFixed(2))),
    //                       DataCell(Text((sub.cost / sub.quantity)
    //                           .toStringAsFixed(2))),
    //                       DataCell(Text(sub.cost.toStringAsFixed(2))),
    //                     ],
    //                   ),
    //                 )
    //           ],
    //         ),
    //       ),
    //       const Divider(),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 'Products Cost',
    //                 style: Theme.of(context).textTheme.subtitle1,
    //               ),
    //               const SizedBox(
    //                 height: 5,
    //               ),
    //               Text(
    //                 "",
    //                 style: Theme.of(context)
    //                     .textTheme
    //                     .headline4!
    //                     .copyWith(fontSize: 14),
    //               ),
    //             ],
    //           ),
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 'Extra Cost',
    //                 style: Theme.of(context).textTheme.subtitle1,
    //               ),
    //               const SizedBox(
    //                 height: 5,
    //               ),
    //               Text(
    //                 // purchases[0].additionalCost.toStringAsFixed(2),
    //                 "",
    //                 style: Theme.of(context)
    //                     .textTheme
    //                     .subtitle2!
    //                     .copyWith(
    //                         color: Colors.red.withOpacity(0.7),
    //                         fontWeight: FontWeight.w600),
    //               ),
    //             ],
    //           ),
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.end,
    //             children: [
    //               Text(
    //                 'Grand Total',
    //                 style: Theme.of(context).textTheme.subtitle1,
    //               ),
    //               const SizedBox(
    //                 height: 5,
    //               ),
    //               Text(
    //                 // (purchases[0].additionalCost +
    //                 //         purchases[0].getTotalOfSubProducts())
    //                 //     .toStringAsFixed(2),
    //                 "",
    //                 style: Theme.of(context).textTheme.headline4,
    //               ),
    //             ],
    //           )
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }
}
