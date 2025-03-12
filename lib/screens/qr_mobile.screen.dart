import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:inventory_app/InventoryModule/providers/inventory_provider.dart';
import 'package:inventory_app/InventoryModule/screens/inventory_detail_screen.dart';
import 'package:inventory_app/commonWidgets/app_bar.dart';
import 'package:inventory_app/commonWidgets/toastmessage.dart';
import 'package:inventory_app/purchaseModule/models/purchase.model.dart';
import 'package:provider/provider.dart';

class FastQRScannerScreen extends StatefulWidget {
  const FastQRScannerScreen({Key? key}) : super(key: key);

  @override
  State<FastQRScannerScreen> createState() => _FastQRScannerScreenState();
}

class _FastQRScannerScreenState extends State<FastQRScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String result = "Scan a QR code";
  bool isProcessing = false;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    } else if (Platform.isIOS) {
      controller?.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Scanner"),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.blue,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 250,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  result,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () async {
              await controller?.toggleFlash();
            },
            child: const Icon(Icons.flash_on),
          ),
          FloatingActionButton(
            onPressed: () async {
              await controller?.flipCamera();
            },
            child: const Icon(Icons.flip_camera_ios),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (!isProcessing && scanData.code != null) {
        setState(() {
          isProcessing = true;
          result = scanData.code!;
        });
        print("Scanned QR Code: \${scanData.code}");
        _handleScannedCode(scanData.code!);
        Future.delayed(const Duration(milliseconds: 1000), () {
          if (mounted) {
            setState(() {
              isProcessing = false;
            });
          }
        });
      }
    });
  }

  void _handleScannedCode(String code) async {
    if (code.split(':').length != 2) {
      showToast(message: "Invalid QR code");
      return;
    }
    final result = await Provider.of<InventoryProvider>(context, listen: false)
        .getProductByQRcode(code.split(':')[0], code.split(':')[1]);

    if (result == null) {
      showToast(message: "Product Not Found In Inventory");
      return;
    }
    if (result['success'] && result['result'] != null) {
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
    showToast(message: "Product Not Exists in Inventory");
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
