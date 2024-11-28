import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:inventory_app/colors.dart';
import 'package:inventory_app/commonWidgets/app_bar.dart';
import 'package:inventory_app/financeModule/model/sales_model.dart';
import 'package:inventory_app/financeModule/widgets/sales_filter.dart';
import 'package:inventory_app/financeModule/widgets/sales_input.dart';
import 'package:inventory_app/purchaseModule/providers/purchase_provider.dart';
import 'package:provider/provider.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({Key? key}) : super(key: key);

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  DateTime? filterStartDate;
  DateTime? filterEndDate;



  addNewSales() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        context: context,
        isScrollControlled: true,
        builder: (context) => const SalesInput()).then((value) {
      if (value != null) {
        print(value);
      }
    });
  }

  addFilter() {
    showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            context: context,
            builder: (context) =>
                SalesFilter(endDate: filterEndDate, startDate: filterStartDate))
        .then((value) {
      print(value);
      if (value != null) {
        setState(() {
          filterStartDate = value['startDate'];
          filterEndDate = value['endDate'];
        });
      }
    });
  }

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () async {
      Provider.of<PurchaseProvider>(context, listen: false).fetchSales();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dW = MediaQuery.of(context).size.width;

    final List<SalesModel> sales =  Provider.of<PurchaseProvider>(context).sales;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Sales',
        actions: [
          Container(
            margin: EdgeInsets.only(right: dW * 0.05),
            child: InkWell(
              onTap: () {
                addFilter();
              },
              child: SvgPicture.asset(
                'assets/svgs/filter.svg',
                color: filterEndDate != null && filterStartDate != null
                    ? iconColor
                    : Colors.black,
                height: 30,
                width: 30,
              ),
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
                .labelSmall!
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
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(
                  height: dW * 0.01,
                ),
                Text(
                  "\u{20B9} ${salesModel.onlineSaleAmount.toStringAsFixed(2)}",
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Cash",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(
                  height: dW * 0.01,
                ),
                Text(
                  "\u{20B9} ${salesModel.cashSaleAmount.toStringAsFixed(2)}",
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
