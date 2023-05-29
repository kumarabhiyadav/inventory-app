import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:inventory_app/commonWidgets/app_bar.dart';
import 'package:inventory_app/financeModule/model/sales_model.dart';
import 'package:inventory_app/financeModule/widgets/sales_input.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({Key? key}) : super(key: key);

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  List<SalesModel> sales = [
    SalesModel(
        cashSaleAmount: 100.00, onlineSaleAmount: 10.99, date: DateTime.now()),
    SalesModel(
        cashSaleAmount: 100.00, onlineSaleAmount: 10.99, date: DateTime.now())
  ];

  addNewSales() {
    showModalBottomSheet(context: context, builder: (context) => SalesInput());
  }

  @override
  Widget build(BuildContext context) {
    final dW = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Sales',
        actions: [
          Container(
            margin: EdgeInsets.only(right: dW * 0.05),
            child: SvgPicture.asset(
              'assets/svgs/filter.svg',
              color: Colors.black,
              height: 30,
              width: 30,
            ),
          ),
        ],
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: dW * 0.05),
        separatorBuilder: (context, index) => const Divider(
          color: Colors.transparent,
        ),
        itemCount: sales.length,
        itemBuilder: (context, index) => SalesList(salesModel: sales[index]),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => addNewSales(),
          icon: const Icon(Icons.add),
          label: Text(
            'Add today\'s Sales',
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
          )),
    );
  }
}

class SalesList extends StatelessWidget {
  const SalesList({Key? key, required this.salesModel}) : super(key: key);
  final SalesModel salesModel;

  @override
  Widget build(BuildContext context) {
    final dW = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(dW * 0.02),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black26, width: .8)),
      margin: EdgeInsets.symmetric(horizontal: dW * 0.05),
      child: Column(children: [
        Row(
          children: [
            Text(
              DateFormat('dd MMM yyyy hh:mm a').format(salesModel.date),
            ),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Online",
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: dW * 0.01,
                ),
                Text(
                  "\u{20B9} ${salesModel.onlineSaleAmount.toStringAsFixed(2)}",
                  style: Theme.of(context).textTheme.headline5,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Cash",
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: dW * 0.01,
                ),
                Text(
                  "\u{20B9} ${salesModel.cashSaleAmount.toStringAsFixed(2)}",
                  style: Theme.of(context).textTheme.headline5,
                )
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
