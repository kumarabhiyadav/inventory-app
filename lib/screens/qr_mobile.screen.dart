import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:camera/camera.dart';
import 'package:inventory_app/InventoryModule/providers/inventory_provider.dart';
import 'package:inventory_app/InventoryModule/screens/inventory_detail_screen.dart';
import 'package:inventory_app/commonWidgets/toastmessage.dart';
import 'package:inventory_app/purchaseModule/models/purchase.model.dart';
import 'package:provider/provider.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({Key? key}) : super(key: key);

  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  CameraController? _cameraController;
  late BarcodeScanner _barcodeScanner;
  bool _isProcessing = false;
  bool _isCameraInitialized = false;
  bool _isFlashOn = false;
  String _qrText = "Scan a QR code";

  @override
  void initState() {
    super.initState();
    myInit();
  }

  Future<void> myInit() async {
    _barcodeScanner = BarcodeScanner();
    await _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final backCamera = cameras.firstWhere(
      (cam) => cam.lensDirection == CameraLensDirection.back,
      orElse: () => cameras.first,
    );

    _cameraController = CameraController(
      backCamera,
      ResolutionPreset.high,
      enableAudio: false,
    );

    try {
      await _cameraController!.initialize();
      await _cameraController!.setFocusMode(FocusMode.auto);
      await _cameraController!.setExposureMode(ExposureMode.auto);

      setState(() => _isCameraInitialized = true);
      _startQRScanning();
    } catch (e) {
      print("Camera initialization error: $e");
    }
  }

  void _toggleFlash() async {
    if (_cameraController != null) {
      _isFlashOn = !_isFlashOn;
      await _cameraController!
          .setFlashMode(_isFlashOn ? FlashMode.torch : FlashMode.off);
      setState(() {});
    }
  }

  void _startQRScanning() {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      print("Camera not initialized yet!");
      return;
    }

    _cameraController!.startImageStream((CameraImage image) async {
      if (_isProcessing) return;
      _isProcessing = true;

      try {
        final inputImage = _convertCameraImageToInputImage(image);
        final barcodes = await _barcodeScanner.processImage(inputImage);

        if (barcodes.isNotEmpty) {
          setState(() {
            _qrText = barcodes.first.displayValue ?? "No data";
          });

          await _cameraController!.stopImageStream();
          _handleScannedCode(_qrText);
        }
      } catch (e) {
        print("QR Scan Error: $e");
      } finally {
        _isProcessing = false;
      }
    });
  }

  InputImage _convertCameraImageToInputImage(CameraImage image) {
    final allBytes = WriteBuffer();
    for (final plane in image.planes) {
      allBytes.putUint8List(plane.bytes);
    }

    final inputImage = InputImage.fromBytes(
      bytes: allBytes.done().buffer.asUint8List(),
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: InputImageRotation.rotation0deg,
        format: InputImageFormat.yuv420,
        bytesPerRow: image.planes[0].bytesPerRow,
      ),
    );

    return inputImage;
  }

  void _handleScannedCode(String code) async {
    if (code == '') {
      showToast(message: "Invalid QR code");
      return;
    }
    final result = await Provider.of<InventoryProvider>(context, listen: false)
        .getProductByQRcode(code);

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
    if (_cameraController != null &&
        _cameraController!.value.isStreamingImages) {
      _cameraController!.stopImageStream();
    }
    _cameraController?.dispose();
    _barcodeScanner.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text("QR Scanner")),
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: size.height * 0.7,
                width: double.infinity,
                child: _isCameraInitialized
                    ? CameraPreview(_cameraController!)
                    : const Center(child: CircularProgressIndicator()),
              ),
              Positioned(
                top: size.height * 0.2,
                left: size.width * 0.15,
                child: Container(
                  width: size.width * 0.7,
                  height: size.width * 0.7,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 4),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(_qrText, style: const TextStyle(fontSize: 18)),
            ),
          ),
          IconButton(
            icon: Icon(
              _isFlashOn ? Icons.flash_on : Icons.flash_off,
              size: 40,
              color: Colors.blue,
            ),
            onPressed: _toggleFlash,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
