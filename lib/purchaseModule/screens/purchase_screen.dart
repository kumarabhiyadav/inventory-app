import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inventory_app/commonWidgets/app_bar.dart';
import 'package:inventory_app/purchaseModule/models/purchase_model.dart';
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
  @override
  Widget build(BuildContext context) {
    final dW = MediaQuery.of(context).size.width;

    final List<PurchaseModel> purchases =
        Provider.of<PurchaseProvider>(context).purchase;
    return Scaffold(
      appBar: const CustomAppBar(title: 'Purchases'),
      body: ListView.builder(
        itemCount: purchases.length,
        itemBuilder: (context,index)=> GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PurchaseDetailScreen(
                            purchaseModel: purchases[index],
                          )));
            },
            child: PurchaseWidget(dW: dW, purchases: purchases),
          ),),
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
              if (value != null) {
              }
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
  final List<PurchaseModel> purchases;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Text(DateFormat('dd MMM yyyy hh:mm a')
                  .format(purchases[0].date)),
            ],
          ),
          const Divider(),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columnSpacing: 20,
              horizontalMargin: 0.0,
              headingRowHeight: 40,
              dataRowHeight: 40,
              columns: const <DataColumn>[
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Name',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Qyt',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Rate',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Total',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
              rows: <DataRow>[
                ...purchases[0].subproducts.map(
                      (sub) => DataRow(
                        cells: <DataCell>[
                          DataCell(Text(sub.subProduct.name)),
                          DataCell(
                              Text(sub.quantity.toStringAsFixed(2))),
                          DataCell(Text((sub.cost / sub.quantity)
                              .toStringAsFixed(2))),
                          DataCell(Text(sub.cost.toStringAsFixed(2))),
                        ],
                      ),
                    )
              ],
            ),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Products Cost',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    purchases[0]
                        .getTotalOfSubProducts()
                        .toStringAsFixed(2),
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontSize: 14),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Extra Cost',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    purchases[0].additionalCost.toStringAsFixed(2),
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(
                            color: Colors.red.withOpacity(0.7),
                            fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Grand Total',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    (purchases[0].additionalCost +
                            purchases[0].getTotalOfSubProducts())
                        .toStringAsFixed(2),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
  