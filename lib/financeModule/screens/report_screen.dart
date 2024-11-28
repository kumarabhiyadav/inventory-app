import 'package:flutter/material.dart';
import 'package:inventory_app/commonWidgets/primary_button.dart';

import '../../commonWidgets/app_bar.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    final dW = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Reports',
        actions: [],
      ),
      body: Center(
        child: PrimaryButton(
          function: () {},
          height: dW * 0.12,
          width: dW * 0.8,
          title: "Download and View report",
          icon: Container(
            margin: EdgeInsets.only(left: dW * 0.04),
            child: const Icon(
              Icons.downloading_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
