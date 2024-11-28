import 'package:flutter/material.dart';
import 'package:inventory_app/commonWidgets/app_bar.dart';
import 'package:inventory_app/commonWidgets/primary_button.dart';
import 'package:inventory_app/purchaseModule/providers/supplier_provider.dart';
import 'package:provider/provider.dart';

class AddSupplierScreen extends StatefulWidget {
  const AddSupplierScreen({super.key});

  @override
  State<AddSupplierScreen> createState() => _AddSupplierScreenState();
}

class _AddSupplierScreenState extends State<AddSupplierScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dW = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const CustomAppBar(title: 'New Supplier'),
      body: Container(
        padding:
            EdgeInsets.symmetric(horizontal: dW * 0.05, vertical: dW * .05),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value!.isEmpty) return "Address can't be empty";
                    return null;
                  },
                  decoration: const InputDecoration(
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      fillColor: Colors.black12,
                      focusColor: Colors.grey,
                      filled: true,
                      hintText: "Supplier Name"),
                ),
              ),
              SizedBox(
                height: dW * 0.04,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: TextFormField(
                  controller: addressController,
                  validator: (value) {
                    if (value!.isEmpty) return "Address can't be empty";
                    return null;
                  },
                  decoration: const InputDecoration(
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      fillColor: Colors.black12,
                      focusColor: Colors.grey,
                      filled: true,
                      hintText: "Supplier Address"),
                ),
              ),
              SizedBox(
                height: dW * 0.05,
              ),
              PrimaryButton(
                  function: () {
                    if(_formKey.currentState!.validate()){
                    Provider.of<SupplierProvider>(context, listen: false)
                        .createSupplier(body: {
                      'name': nameController.text,
                      'address': addressController.text
                    });}
                    Navigator.pop(context);
                  },
                  height: dW * .12,
                  title: "Create New Suppier",
                  width: double.infinity)
            ],
          ),
        ),
      ),
    );
  }
}
