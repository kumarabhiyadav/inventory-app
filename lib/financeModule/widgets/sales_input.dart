import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inventory_app/commonWidgets/primary_button.dart';
import 'package:inventory_app/financeModule/model/sales_model.dart';
import 'package:inventory_app/purchaseModule/providers/purchase_provider.dart';
import 'package:provider/provider.dart';

class SalesInput extends StatefulWidget {
  const SalesInput({Key? key}) : super(key: key);

  @override
  State<SalesInput> createState() => _SalesInputState();
}

class _SalesInputState extends State<SalesInput> {
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  TextEditingController dateController = TextEditingController();
  TextEditingController onlineAmountController = TextEditingController();
  TextEditingController cashAmountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      dateController.text = DateFormat('dd MMM yyyy').format(selectedDate);
    });
  }

  formSubmit() {
    if (_formKey.currentState!.validate()) {
      Provider.of<PurchaseProvider>(context, listen: false).createSales(body: {
        'date': selectedDate.toIso8601String(),
        'onlineAmount': onlineAmountController.text,
        'cashAmount': cashAmountController.text
      });

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dW = MediaQuery.of(context).size.width;
    final dH = MediaQuery.of(context).size.height;

    return Container(
      height: dH * 0.8,
      padding: EdgeInsets.all(dW * 0.05),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: GestureDetector(
                onTap: () => showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2021),
                  lastDate: DateTime(DateTime.now().year + 1),
                ).then((value) {
                  if (value != null) {
                    selectedDate = value;
                    setState(() {
                      dateController.text =
                          DateFormat('dd MMM yyyy').format(value);
                    });
                  }
                }),
                child: TextFormField(
                  controller: dateController,
                  validator: ((value) {
                    if (value!.trim().isEmpty) return "Please Choose a date";
                    return null;
                  }),
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600),
                  enabled: false,
                  decoration: const InputDecoration(
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      fillColor: Colors.black12,
                      focusColor: Colors.grey,
                      filled: true,
                      hintText: "Select Date"),
                ),
              ),
            ),
            SizedBox(
              height: dW * 0.05,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: TextFormField(
                controller: onlineAmountController,
                validator: ((value) {
                  if (value!.isEmpty) return "Please enter online Amount";
                  if (double.tryParse(value) == null)
                    return "Please enter number only";
                  return null;
                }),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    fillColor: Colors.black12,
                    focusColor: Colors.grey,
                    filled: true,
                    label: Text("Online Amount"),
                    hintText: "Enter online amount received..."),
              ),
            ),
            SizedBox(
              height: dW * 0.05,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: TextFormField(
                controller: cashAmountController,
                validator: ((value) {
                  if (value!.isEmpty) return "Please enter cash Amount";
                  if (double.tryParse(value) == null)
                    return "Please enter number only";
                  return null;
                }),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    fillColor: Colors.black12,
                    focusColor: Colors.grey,
                    filled: true,
                    label: Text("Cash Amount"),
                    hintText: "Enter cash amount received..."),
              ),
            ),
            SizedBox(
              height: dW * 0.05,
            ),
            PrimaryButton(
                function: formSubmit,
                height: dW * 0.12,
                title: 'Add Sales Amount',
                width: double.infinity)
          ],
        ),
      ),
    );
  }
}
