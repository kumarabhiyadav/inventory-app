import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inventory_app/commonWidgets/primary_button.dart';
import 'package:inventory_app/financeModule/model/sales_model.dart';

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
                  if (value != null) {
                    if (double.tryParse(value) != null) {
                      return null;
                    }
                  } else {
                    return 'Enter online amount';
                  }
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
                  if (value != null) {
                    if (double.tryParse(value) != null) {
                      return null;
                    }
                  } else {
                    return 'Enter cash amount';
                  }
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
                function: () {
                  if (onlineAmountController.text.isEmpty &&
                      cashAmountController.text.isEmpty) {
                    Navigator.pop(context);
                  } else {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context, {
                        'online':
                            double.tryParse(onlineAmountController.text) ?? 0.0,
                        'cash':
                            double.tryParse(cashAmountController.text) ?? 0.0,
                      });
                    }
                  }
                },
                height: dW * 0.12,
                title: 'Add Sales Amount',
                width: double.infinity)
          ],
        ),
      ),
    );
  }
}
