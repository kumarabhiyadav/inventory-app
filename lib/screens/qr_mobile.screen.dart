// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:inventory_app/InventoryModule/providers/inventory_provider.dart';
import 'package:inventory_app/InventoryModule/screens/inventory_detail_screen.dart';
import 'package:inventory_app/commonWidgets/app_bar.dart';
import 'package:inventory_app/commonWidgets/toastmessage.dart';
import 'package:inventory_app/purchaseModule/models/purchase.model.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';

class MobielScannerScreen extends StatefulWidget {
  const MobielScannerScreen({super.key});

  @override
  State<MobielScannerScreen> createState() => _MobielScannerScreenState();
}

class _MobielScannerScreenState extends State<MobielScannerScreen> {
  final MobileScannerController controller = MobileScannerController();
  bool isScanning = true;
  void _onBarcodeScanned(BarcodeCapture _barcodeCapture) {
    String code =
        _barcodeCapture.barcodes.firstOrNull?.rawValue ?? 'No barcode detected';

    if (code == "No barcode detected") {
      showToast(
          message: "No Product found",
          color: Theme.of(context).colorScheme.error);
    } else {
      if (isScanning) {
        _showResultDialog(code);
        setState(() {
          isScanning = false;
        });
      }
    }
  }

  void _showResultDialog(String code) async {
    if (code.split(':').length != 2) {
      showToast(message: "Invalid QR code");

      return;
    }
    final result = await Provider.of<InventoryProvider>(context, listen: false)
        .getProductByQRcode(code.split(':')[0], code.split(':')[1]);

    if (result == null) {
      showToast(message: "Product Not Fount In Inventory");
      return;
    }
    if (result['success'] && result['result'] != null) {
      print(result['success']);
      PurchaseSubProduct subProduct =
          PurchaseSubProduct.fromJson(result['result']);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => InventoryDetailScreen(
                    subProduct: subProduct,
                    inStock: result['inStock'],
                    code: code.split(':')[0],
                    pass: code.split(':')[1],
                    logs: result['log'],
                  )));

      return;
    }
    showToast(message: "Product Not Exists in inventory");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Scanner"),
      body: Center(
        child: MobileScanner(
          controller: controller,
          onDetect: (barcodeCapture) {
            _onBarcodeScanned(barcodeCapture);
          },
        ),
      ),
    );
  }
}
