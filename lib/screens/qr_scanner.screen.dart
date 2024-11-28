import 'package:flutter/material.dart';
import 'package:inventory_app/InventoryModule/providers/inventory_provider.dart';
import 'package:inventory_app/InventoryModule/screens/inventory_detail_screen.dart';
import 'package:inventory_app/commonWidgets/toastmessage.dart';
import 'package:inventory_app/purchaseModule/models/purchase.model.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({super.key});

  @override
  State<QRScannerPage> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isScanning = true;
  bool isFlashOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scanner'),
        actions: [
          IconButton(
            icon: Icon(
              isFlashOn ? Icons.flash_on : Icons.flash_off,
            ),
            onPressed: () async {
              await controller?.toggleFlash();
              setState(() {
                isFlashOn = !isFlashOn;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.flip_camera_ios),
            onPressed: () async {
              await controller?.flipCamera();
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.blue,
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: MediaQuery.of(context).size.width * 0.8,
            ),
          ),
          // Optional: Add a message at the bottom
          const Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Text(
              'Align QR code within the frame to scan',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                backgroundColor: Colors.black54,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (isScanning) {
        setState(() => isScanning = false);
        _showResultDialog(scanData.code);
      }
    });
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
              builder: (context) =>
                  InventoryDetailScreen(subProduct: subProduct,inStock:result['inStock'],code:code.split(':')[0],pass:code.split(':')[1],logs: result['log'],)));

      return;
    }
    showToast(message: "Product Not Exists in inventory");

    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return AlertDialog(
    //       title: const Text('QR Code Found!'),
    //       content: SingleChildScrollView(
    //         child: ListBody(
    //           children: [
    //             Text('Content: $code'),
    //           ],
    //         ),
    //       ),
    //       actions: [
    //         TextButton(
    //           child: const Text('Scan Again'),
    //           onPressed: () {
    //             setState(() => isScanning = true);
    //             Navigator.of(context).pop();
    //           },
    //         ),
    //       ],
    //     );
    //   },
    // );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    controller?.pauseCamera();
    controller?.resumeCamera();
  }
}
