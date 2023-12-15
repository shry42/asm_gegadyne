import 'dart:convert';

import 'package:asm_gegadyne/controllers/app_controllers.dart';
import 'package:asm_gegadyne/controllers/assets_controller.dart';
import 'package:asm_gegadyne/screens/asset_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class QRScannerScreen extends StatefulWidget {
  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  final AssestsController ac = Get.put(AssestsController());
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String qrText = '';
  Map<String, dynamic> decodedData = {};
  String firstName = '';
  String firstNamee = '';
  int? id;
  int? empId;

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
            'Camera permission is permanently denied. Please go to app settings and grant the permission manually.No data is being collected'),
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
    print(AppController.accessToken);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR Code'),
        backgroundColor: Colors.lightGreen,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.lightGreen,
                Colors.white70,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0.0,
                1.0,
              ],
            ),
          ),
          child: Column(children: [
            Container(
              height: 600,
              width: 500,
              child: Column(
                children: [
                  SizedBox(height: 80),
                  Container(
                    height: 300,
                    width: 280,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black,
                      border: Border.all(
                        width: 4,
                      ),
                    ),
                    child: QRView(
                      key: qrKey,
                      onQRViewCreated: _onQRViewCreated,
                    ),
                  ),
                  // Button
//Spacing
                  SizedBox(height: 40),
                  Shimmer(
                    duration: Duration(seconds: 2),
                    // This is NOT the default value. Default value: Duration(seconds: 0)
                    interval: Duration(seconds: 1),
                    // This is the default value
                    color: Colors.white,
                    // This is the default value
                    colorOpacity: 1,
                    // This is the default value
                    enabled: true,
                    // This is the default value
                    direction: ShimmerDirection.fromLTRB(),
                    child: Container(
                      height: 50,
                      width: 260,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(25)),
                      child: ElevatedButton(
                        onPressed: () async {
                          //
                          await ac.fetchAssetById();
                          await Get.to(AssetDetailsScreen(),
                              transition: Transition.rightToLeft);
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                'Click to Fetch details',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() async {
        qrText = scanData.code!;
        decodedData = json.decode(qrText);
        id = decodedData['id'];
        AppController.setid(id);
        empId = decodedData['emp_Id'];
        AppController.setempId(empId);
        await ac.fetchAssetById();
        await Get.to(AssetDetailsScreen(), transition: Transition.rightToLeft);

        // Process the scanned QR code data here
      });
    });
  }

  // String lastName = decodedData['lastName'] ?? 'Scan properly';

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
