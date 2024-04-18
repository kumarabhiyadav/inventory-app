import 'package:flutter/material.dart';
import 'package:inventory_app/purchaseModule/models/supplier.model.dart';
import 'package:inventory_app/purchaseModule/providers/purchase_provider.dart';
import 'package:inventory_app/purchaseModule/providers/supplier_provider.dart';
import 'package:inventory_app/purchaseModule/screens/show_added_purchase_products.dart';
import 'package:provider/provider.dart';


import 'supplier_tile.dart';

class SelectSupplierForPurchase extends StatefulWidget {
  const SelectSupplierForPurchase({Key? key}) : super(key: key);

  @override
  State<SelectSupplierForPurchase> createState() =>
      _SelectSupplierForPurchaseState();
}

class _SelectSupplierForPurchaseState extends State<SelectSupplierForPurchase> {

  @override
  void initState() {
    myInit();
    super.initState();
  }

  myInit()async {

    await Provider.of<SupplierProvider>(context,listen: false).fetchSuppliers();
     
  }

  @override
  Widget build(BuildContext context) {
    final List<SupplierModel> suppliers =
        Provider.of<SupplierProvider>(context).filteredList;
    final dW = MediaQuery.of(context).size.width;
    final dH = MediaQuery.of(context).size.height;

    return Container(
      height: dH * 0.9,
      padding: EdgeInsets.only(
        top: dW * 0.1,
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: dW * 0.05),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: TextFormField(
                onChanged: ((value) => Provider.of<SupplierProvider>(context,listen: false).searchSupplier(value)),
                decoration: const InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    fillColor: Colors.black12,
                    focusColor: Colors.grey,
                    filled: true,
                    hintText: "Search supplier..."),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: ((context, index) => const Divider(color: Colors.transparent,)),
              padding: EdgeInsets.symmetric(vertical: dW * 0.05),
              itemCount: suppliers.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {   
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowAddPurchaseProducts(
                                supplierModel: suppliers[index],
                              )));
                },
                child: SupplierTile(
                  dW: dW,
                  supplier: suppliers[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
