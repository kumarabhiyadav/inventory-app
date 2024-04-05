import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_app/InventoryModule/models/inventory_models.dart';
import 'package:inventory_app/commonWidgets/primary_button.dart';
import 'package:provider/provider.dart';

import '../../InventoryModule/providers/inventory_provider.dart';
import 'sub_product_tile.dart';

class AddProductForPurchase extends StatefulWidget {
  const AddProductForPurchase({Key? key,required this.subProductModel}) : super(key: key);

  final SubProductModel subProductModel;

  @override
  State<AddProductForPurchase> createState() => _AddProductForPurchaseState();
}

class _AddProductForPurchaseState extends State<AddProductForPurchase> {
  String selectedUnit = "Meter";
  TextEditingController _costController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dH = MediaQuery.of(context).size.height;
    final dW = MediaQuery.of(context).size.width;


    return Container(
      height: dH * 0.9,
      width: double.infinity,
      padding: EdgeInsets.all(dH * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Unit"),
          SizedBox(
            height: 10,
          ),
          Wrap(
            spacing: 10,
            children: [
              ...['Meter', 'Numbers'].map((e) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedUnit = e;
                    });
                  },
                  child: Chip(
                    label: Text(
                      e,
                      style: TextStyle(
                          color: e == selectedUnit
                              ? Theme.of(context).colorScheme.background
                              : null),
                    ),
                    backgroundColor: e == selectedUnit
                        ? Theme.of(context).colorScheme.primary
                        : null,
                  )))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("Cost"),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            keyboardType: const TextInputType.numberWithOptions(),
            controller: _costController,
            decoration: const InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                fillColor: Colors.black12,
                focusColor: Colors.grey,
                filled: true,
                hintText: "Cost of Product"),
          ),

          const SizedBox(
            height: 10,
          ),
          const Text("Quantity"),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: _quantityController,
            keyboardType: const TextInputType.numberWithOptions(),
            decoration: const InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                
                fillColor: Colors.black12,
                focusColor: Colors.grey,
                filled: true,
                
                hintText: "Quantity"),
          ),
          SizedBox(height: dH*0.05,),
          PrimaryButton(function: (){

          }, height: dW*0.12, title: "Save Product", width: double.infinity)
        ],
      ),
    );
  }
}
