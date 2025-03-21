import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inventory_app/InventoryModule/providers/inventory_provider.dart';
import 'package:inventory_app/commonWidgets/app_bar.dart';
import 'package:provider/provider.dart';

class InventoryHistoryScreen extends StatefulWidget {
  const InventoryHistoryScreen({super.key});

  @override
  State<InventoryHistoryScreen> createState() => _InventoryHistoryScreenState();
}

class _InventoryHistoryScreenState extends State<InventoryHistoryScreen> {
  myInit() async {
    await Provider.of<InventoryProvider>(context, listen: false)
        .getInventoryDetails();
  }

  @override
  void initState() {
    myInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<dynamic> logs =
        Provider.of<InventoryProvider>(context).inventoryLogs;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(title: "Inventory History"),
      body: ListView.separated(
        padding: EdgeInsets.all(size.width*0.05),
        separatorBuilder: (context, index) => SizedBox(height: size.width*0.015,),
        itemCount: logs.length,
        itemBuilder: (context, index) => Container(
          // margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8)),
          child: Card(
            child: ListTile(
              title: Text(
                logs[index]['name'],
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              
              trailing: Text("${logs[index]['qyt']}/${logs[index]['totalqyt']}",
                  style: Theme.of(context).textTheme.bodyMedium),
                  subtitle: Text(DateFormat('dd MMM yyyy hh:mm a').format(DateTime.parse(logs[index]['createdAt']).toLocal()), style: Theme.of(context).textTheme.bodySmall),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text("Sell"),
        icon: Icon(Icons.qr_code),
      ),
    );
  }
}
