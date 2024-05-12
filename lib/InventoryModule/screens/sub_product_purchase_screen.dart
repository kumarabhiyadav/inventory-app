import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inventory_app/InventoryModule/models/inventory_models.dart';
import 'package:inventory_app/commonWidgets/app_bar.dart';
import 'package:inventory_app/commonWidgets/common_functions.dart';
import 'package:inventory_app/purchaseModule/providers/purchase_provider.dart';
import 'package:inventory_app/purchaseModule/screens/purhcase_detail_screen.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SubProductPurchase extends StatefulWidget {
  SubProductPurchase({super.key, required this.subProductModel});
  SubProductModel subProductModel;

  @override
  State<SubProductPurchase> createState() => _SubProductPurchaseState();
}

class _SubProductPurchaseState extends State<SubProductPurchase> {
  myInit() async {
    await Provider.of<PurchaseProvider>(context, listen: false)
        .fetchSubProductPurchases(id: widget.subProductModel.id);
  }

  @override
  void initState() {
    myInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dW = MediaQuery.of(context).size.width;
    final List subproductPurchase =
        Provider.of<PurchaseProvider>(context).subProductpurchase;
    return Scaffold(
      appBar: CustomAppBar(title: widget.subProductModel.name),
      body: ListView.separated(
        separatorBuilder: ((context, index) => const Divider(
              color: Colors.transparent,
            )),
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), border: Border.all()),
          margin: EdgeInsets.symmetric(horizontal: dW * 0.05),
          padding: EdgeInsets.symmetric(
            horizontal: dW * 0.02,
            vertical: dW * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    subproductPurchase[index]['supplier']['name'],
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    DateFormat('dd MMM yyyy').format(
                        DateTime.parse(subproductPurchase[index]['createdAt'])),
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
              SizedBox(
                height: dW * 0.02,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Quantity"),
                          Text(
                              subproductPurchase[index]['quantity'].toString()),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Rate Per Unit"),
                          Text(double.parse(
                                  subproductPurchase[index]['cost'].toString())
                              .toStringAsFixed(2))
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Total"),
                          Text((double.parse(subproductPurchase[index]
                                          ['quantity']
                                      .toString()) *
                                  double.parse(subproductPurchase[index]['cost']
                                      .toString()))
                              .toStringAsFixed(2)),
                        ],
                      ),
                      SizedBox(
                          height: dW * 0.1,
                          width: dW * 0.1,
                          child: subproductPurchase[index]['image'] != null
                              ? const Icon(Icons.image_not_supported_rounded)
                              : GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ShowImage(
                                                url: subproductPurchase[index]
                                                    ['image'],
                                                title: widget
                                                    .subProductModel.name)));
                                  },
                                  child: Image.network(
                                      subproductPurchase[index]['image'])))
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
                          Text(
                            (calculateNumberWithPercentage(
                                    (subproductPurchase[index]['cost'] as int)
                                        .toDouble(), // Convert int to double
                                    double.parse(subproductPurchase[index]
                                            ['purchasePercent']
                                        .toString()))) // Convert int to double
                                .toStringAsFixed(2),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('MRP %'),
                          Text((subproductPurchase[index]['purchasePercent'])
                              .toStringAsFixed(2)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Selling %'),
                          Text((subproductPurchase[index]['salesPercent'])
                              .toStringAsFixed(2)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text('Selling Price'),
                          Text(
                            (calculateNumberWithPercentage(
                                    (subproductPurchase[index]['cost'] as int)
                                        .toDouble(), // Cast to int then to double
                                    (subproductPurchase[index]['salesPercent']
                                            as int)
                                        .toDouble())) // Cast to int then to double
                                .toStringAsFixed(2),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        itemCount: subproductPurchase.length,
      ),
    );
  }
}
