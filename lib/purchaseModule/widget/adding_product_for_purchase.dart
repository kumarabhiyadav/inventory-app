import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory_app/InventoryModule/models/inventory_models.dart';
import 'package:inventory_app/commonWidgets/common_functions.dart';
import 'package:inventory_app/commonWidgets/primary_button.dart';
import 'package:inventory_app/commonWidgets/toastmessage.dart';
import 'package:inventory_app/purchaseModule/models/purchase.model.dart';
import 'package:inventory_app/purchaseModule/providers/purchase_provider.dart';
import 'package:inventory_app/purchaseModule/screens/show_added_purchase_products.dart';
import 'package:provider/provider.dart';

class AddProductForPurchase extends StatefulWidget {
  const AddProductForPurchase({Key? key, required this.subProductModel})
      : super(key: key);

  final SubProductModel subProductModel;

  @override
  State<AddProductForPurchase> createState() => _AddProductForPurchaseState();
}

class _AddProductForPurchaseState extends State<AddProductForPurchase> {
  String selectedUnit = "Meter";
  final TextEditingController _costController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _mrpController = TextEditingController();
  final TextEditingController _salesController = TextEditingController();

  String mrpMessage = "";
  String sellingMessage = "";

  File? _image;
  final picker = ImagePicker();

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        print(_image);
      } else {
        print('No image selected.');
      }
    });
  }

  bool checkPercentageOfMRPandSells() {
    if (_mrpController.text.isEmpty) {
      return false;
    }

    double? mrp = double.tryParse(_mrpController.text);
    if (mrp != null) {
      double? cost = double.tryParse(_costController.text);
      double? sales = double.tryParse(_salesController.text);

      if (cost != null && sales != null) {
        // return mrp <= calculateNumberWithPercentage(cost, sales);
        return sales <= mrp;
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    final dH = MediaQuery.of(context).size.height;
    final dW = MediaQuery.of(context).size.width;

    return Container(
      height: dH * 0.9,
      width: double.infinity,
      padding: EdgeInsets.all(dH * 0.02),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.subProductModel.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Divider(),
            const Text("Unit"),
            const SizedBox(
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
            const Text("Rate"),
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
                  hintText: "Rate of Product"),
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
            const SizedBox(
              height: 10,
            ),
            const Text("MRP"),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: _mrpController,
              onChanged: ((value) {
                if (value.isEmpty) {
                  setState(() {
                    mrpMessage = "";
                  });
                }
                if (double.tryParse(value) != null &&
                    double.tryParse(_costController.text) != null) {
                  setState(() {
                    mrpMessage =
                        "Difference of MRP % ${calculatePercentageDifference(double.parse(_costController.text), double.parse(value))}";
                  });
                }
              }),
              keyboardType: const TextInputType.numberWithOptions(),
              decoration: const InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  fillColor: Colors.black12,
                  focusColor: Colors.grey,
                  filled: true,
                  hintText: "MRP"),
            ),
            Text(
              mrpMessage,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Selling Price"),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: _salesController,
              onChanged: ((value) {
                if (value.isEmpty) {
                  setState(() {
                    sellingMessage = "";
                  });
                }
                if (double.tryParse(value) != null &&
                    double.tryParse(_costController.text) != null) {
                  setState(() {
                    sellingMessage =
                        "Difference of Selling % ${calculatePercentageDifference(double.parse(_costController.text), double.parse(value))}";
                  });
                }
              }),
              keyboardType: const TextInputType.numberWithOptions(),
              decoration: const InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  fillColor: Colors.black12,
                  focusColor: Colors.grey,
                  filled: true,
                  hintText: "Selling Price"),
            ),
            Text(
              sellingMessage,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            SizedBox(
              height: dH * 0.025,
            ),
            GestureDetector(
              onTap: getImageFromCamera,
              onLongPress: getImageFromGallery,
              child: Container(
                height: dW * 0.2,
                width: dW * 0.2,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                // child: _image!=null?  const Icon(Icons.camera_alt),
                child: _image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          File(_image!.path),
                          fit: BoxFit.fill,
                        ))
                    : const Icon(Icons.camera_alt),
              ),
            ),
            SizedBox(
              height: dH * 0.05,
            ),
            PrimaryButton(
                function: () {
                  if (checkPercentageOfMRPandSells()) {
                    Provider.of<PurchaseProvider>(context, listen: false)
                        .addSubProductForPurchase(PurchaseSubProduct(
                            id: "",
                            cost: double.parse(_costController.text),
                            image: _image != null ? _image!.path : "",
                            subproduct: widget.subProductModel.id,
                            name: widget.subProductModel.name,
                            unit: selectedUnit,
                            mrp: _mrpController.text.isEmpty
                                ? 0.0
                                : double.parse(_mrpController.text),
                            sellingprice: _salesController.text.isEmpty
                                ? 0.0
                                : double.parse(_salesController.text),
                            quantity: double.parse(_quantityController.text)));

                    // Navigator.push(context,MaterialPageRoute(builder: (context)=>ShowAddPurchaseProducts(supplierModel: Provider.of<PurchaseProvider>(context,listen: false).currentPurchaseModel!.supplier)));
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShowAddPurchaseProducts(
                                supplierModel: Provider.of<PurchaseProvider>(
                                        context,
                                        listen: false)
                                    .currentPurchaseModel!
                                    .supplier)),
                        (route) => false);
                  } else {
                    showToast(message: "Selling Price should be less than MRP");
                  }
                },
                height: dW * 0.12,
                title: "Save Product",
                width: double.infinity)
          ],
        ),
      ),
    );
  }
}
