import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../commonWidgets/primary_button.dart';

class SalesFilter extends StatefulWidget {
  const SalesFilter({Key? key, required this.endDate, required this.startDate})
      : super(key: key);
  final DateTime? startDate;
  final DateTime? endDate;

  @override
  State<SalesFilter> createState() => _SalesFilterState();
}

class _SalesFilterState extends State<SalesFilter> {
  DateTime? startDate;
  DateTime? endDate;
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  @override
  void initState() {
    super.initState();

    setState(() {
      startDate = widget.startDate;
      endDate = widget.endDate;
      if (startDate != null && endDate != null) {
        startDateController.text = DateFormat('dd MMM yyyy').format(startDate!);
        endDateController.text = DateFormat('dd MMM yyyy').format(endDate!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final dW = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(dW * 0.05),
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
                  startDate = value;
                  setState(() {
                    startDateController.text =
                        DateFormat('dd MMM yyyy').format(value);
                  });
                }
              }),
              child: TextFormField(
                controller: startDateController,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w600),
                enabled: false,
                decoration: const InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    fillColor: Colors.black12,
                    focusColor: Colors.grey,
                    filled: true,
                    hintText: "Select start date"),
              ),
            ),
          ),
          SizedBox(
            height: dW * 0.05,
          ),
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
                  endDate = value;
                  setState(() {
                    endDateController.text =
                        DateFormat('dd MMM yyyy').format(value);
                  });
                }
              }),
              child: TextFormField(
                controller: endDateController,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w600),
                enabled: false,
                decoration: const InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    fillColor: Colors.black12,
                    focusColor: Colors.grey,
                    filled: true,
                    hintText: "Select end date"),
              ),
            ),
          ),
          SizedBox(
            height: dW * 0.05,
          ),
          PrimaryButton(
              function: () {
                if (startDate == null || endDate == null) {
                  Navigator.pop(context);
                }
                Navigator.pop(
                    context, {'startDate': startDate, 'endDate': endDate});
              },
              height: dW * 0.12,
              title: 'Apply Filter',
              width: double.infinity)
        ],
      ),
    );
  }
}
