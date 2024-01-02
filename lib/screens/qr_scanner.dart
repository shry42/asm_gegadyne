import 'dart:convert';

import 'package:asm_gegadyne/controllers/app_controllers.dart';
import 'package:asm_gegadyne/controllers/assets_controller.dart';
import 'package:asm_gegadyne/controllers/assets_edit_controller.dart';
import 'package:asm_gegadyne/models/asset_model.dart';
import 'package:asm_gegadyne/screens/asset_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

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
  final AssetsEditController editAssetController =
      Get.put(AssetsEditController());

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
        title: const Text('Permission Denied'),
        content:
            const Text('Please grant camera permission to use QR scanner.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
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
        title: const Text('Permission Permanently Denied'),
        content: const Text(
            'Camera permission is permanently denied. Please go to app settings and grant the permission manually.No data is being collected'),
        actions: [
          TextButton(
            onPressed: () {
              // Open app settings
              openAppSettings();
            },
            child: const Text('Open Settings'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
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
          decoration: const BoxDecoration(
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
            SizedBox(
              height: 600,
              width: 500,
              child: Column(
                children: [
                  const SizedBox(height: 80),
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
                  const SizedBox(height: 40),
                  Shimmer(
                    duration: const Duration(seconds: 2),
                    // This is NOT the default value. Default value: Duration(seconds: 0)
                    interval: const Duration(seconds: 1),
                    // This is the default value
                    color: Colors.white,
                    // This is the default value
                    colorOpacity: 1,
                    // This is the default value
                    enabled: true,
                    // This is the default value
                    direction: const ShimmerDirection.fromLTRB(),
                    child: Container(
                      height: 50,
                      width: 260,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(25)),
                      child: ElevatedButton(
                        onPressed: () async {
                          //
                          List<Asset> assets = await ac.fetchAssetById();

                          //
                          editAssetController.firstName.value =
                              assets[0].firstName;
                          editAssetController.lastName.value =
                              ac.assets[0].lastName;
                          editAssetController.ram.value =
                              ac.assets[0].ram.toString();
                          editAssetController.id.value =
                              ac.assets[0].id.toString();
                          editAssetController.empId.value =
                              ac.assets[0].empId.toString();
                          editAssetController.make.value =
                              ac.assets[0].make.toString();
                          editAssetController.serialNo.value =
                              ac.assets[0].serialNo.toString();
                          editAssetController.assetTag.value =
                              ac.assets[0].assetTag;
                          editAssetController.imeiNo.value =
                              ac.assets[0].imeiNo;
                          editAssetController.OSversion.value =
                              ac.assets[0].osVersion;
                          editAssetController.SSD.value = ac.assets[0].ssd;
                          editAssetController.processor.value =
                              ac.assets[0].processor;
                          editAssetController.wifiMacAddress.value =
                              ac.assets[0].wifiMacAddress;
                          editAssetController.lanMacAddress.value =
                              ac.assets[0].lanMacAddress;
                          editAssetController.approvalStatus.value =
                              ac.assets[0].approvalStatus;
                          // editAssetController.c = ac.assets[0].createdBy.toString();
                          editAssetController.isActive.value =
                              ac.assets[0].isActive.toString();
                          editAssetController.ram.value =
                              ac.assets[0].ram.toString();
                          //

                          await Get.to(const AssetDetailsScreen(),
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
        await Get.to(const AssetDetailsScreen(),
            transition: Transition.rightToLeft);

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
