import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerScreen extends StatefulWidget {
  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String qrText = '';

  @override
  void initState() {
    super.initState();
    _checkPermission();
  }

  // Check and request camera permission
  // Check and request camera permission
Future<void> _checkPermission() async {
  if (await Permission.camera.request().isGranted) {
    // Permission is granted, start the QR scanner
    _startScanner();
  } else if (await Permission.camera.isDenied) {
    // Permission has been denied once, request again or handle accordingly
    // Show a dialog explaining the need for the camera permission and ask again
    _showPermissionDeniedDialog();
  } else if (await Permission.camera.isPermanentlyDenied) {
    // Permission has been permanently denied
    // Display an informative dialog or navigate the user to app settings
    _showPermissionPermanentlyDeniedDialog();
  }
}

// Start the QR scanner
void _startScanner() {
  // Start the QR scanner code here
  // Initialize the QR scanner controller and listen for scanned data
  // ...
}

// Show a dialog for denied permission
void _showPermissionDeniedDialog() {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Permission Denied'),
      content: Text('Please grant camera permission to use QR scanner.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('OK'),
        ),
      ],
    ),
  );
}

// Show a dialog for permanently denied permission
void _showPermissionPermanentlyDeniedDialog() {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Permission Permanently Denied'),
      content: Text(
          'Camera permission is permanently denied. Please go to app settings and grant the permission manually.'),
      actions: [
        TextButton(
          onPressed: () {
            // Open app settings
            openAppSettings();
          },
          child: Text('Open Settings'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
      ],
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan QR Code'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text('Scanned Data: $qrText'),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData.code!;
        // Process the scanned QR code data here
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
