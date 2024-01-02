import 'dart:convert';

import 'package:asm_gegadyne/controllers/app_controllers.dart';
import 'package:asm_gegadyne/controllers/assets_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AssetsEditController extends GetxController {
  final AssestsController ac = Get.put(AssestsController());
  // RxString status = "".obs;
  RxString updateStatus = "".obs;
  RxString firstName = "".obs;
  RxString ram = "".obs;
  RxString lastName = "".obs;
  RxString id = "".obs;
  RxString empId = "".obs;
  RxString isActive = "".obs;
  RxString make = "".obs;
  RxString type = "".obs;
  RxString serialNo = "".obs;
  RxString assetTag = "".obs;
  RxString imeiNo = "".obs;
  RxString OSversion = "".obs;
  RxString SSD = "".obs;

  RxString processor = "${AppController.processor}".obs;
  RxString lanMacAddress = "${AppController.lanMacAddress}".obs;
  RxString wifiMacAddress = "${AppController.wifiMacAddress}".obs;
  RxString approvalStatus = "${AppController.approvalStatus}".obs;
  RxString createdBy = "${AppController.createdBy}".obs;
  RxString createdAt = "${AppController.createdAt}".obs;

  Future<void> editAssetPost() async {
    http.Response response = await http.post(
      Uri.parse('http://192.168.100.45:4000/api/assets/updateAsset'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppController.accessToken}',
      },
      body: json.encode({
        "id": id.value.toString(),
        "emp_Id": empId.value.toString(),
        "make": make.value.toString(),
        "type": make.value.toString(),
        "serialNo": serialNo.value.toString(),
        "assetTag": assetTag.value.toString(),
        "imeiNo": imeiNo.value.toString(),
        "OSversion": OSversion.value.toString(),
        "SSD": SSD.value.toString(),
        "ram": ram.value.toString(),
        "processor": processor.value.toString(),
        "lanMacAddress": ram.value.toString(),
        "wifiMacAddress": wifiMacAddress.value.toString(),
        "approvalStatus": approvalStatus.value.toString()

        // "id": "${AppController.aid}",
        // "emp_Id": "${AppController.aempId}",
        // "make": "${AppController.make}",
        // "serialNo": "${AppController.serialNo}",
        // "assetTag": "${AppController.assetTag}",
        // "imeiNo": "${AppController.imeiNo}",
        // "OSversion": "${AppController.OSversion}",
        // "SSD": "${AppController.SSD}",
        // "ram": "${AppController.ram}",
        // "processor": "${AppController.processor}",
        // "lanMacAddress": "${AppController.lanMacAddress}",
        // "wifiMacAddress": "${AppController.wifiMacAddress}",
        // "approvalStatus": "${AppController.approvalStatus}",

        // "id": 4,
        // "emp_Id": "1",
        // "make": "macbookPro",
        // "serialNo": "13dyet3ry7yfueh1",
        // "assetTag": "white1",
        // "imeiNo": "w12etfddsxfdx1",
        // "OSversion": "121",
        // "SSD": "12bsdf1",
        // "ram": "sahdwyegdsc1",
        // "processor": "gdsywshgfchgsd1",
        // "lanMacAddress": "ajsgdcysgcsj1",
        // "wifiMacAddress": "wifiMacAddress1",
        // "approvalStatus": "YES"
      }),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> result = json.decode(response.body);
      // updateStatus = result['message'];
      bool? status = result['status'];

      if (status == true) {
        Get.defaultDialog(
          title: "Success",
          middleText: "Assets updated successfully\n  Re-Scan to verify",
          textConfirm: "OK",
          confirmTextColor: Colors.white,
          onConfirm: () async {
            Get.back(); // Close the dialog
            // Get.offAll(QRScannerScreen());
          },
        );
      } else {
        Get.defaultDialog(
          title: "Error",
          middleText: "Could not update",
          textConfirm: "OK",
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back(); // Close the dialog
          },
        );
      }
    }
  }
}

//Mocked API

  // Future<void> editAssetPost() async {
  //   // Simulated response data (mocked response similar to the provided data)
  //   final simulatedResponse = {
  //     "status": true,
  //     "message": "Assets update successfully"
  //   };

  //   // Process the simulated response as if it came from an API request
  //   if (simulatedResponse['status'] == true) {
  //     updateStatus.value = (simulatedResponse['message'] ?? "").toString();
  //     Get.defaultDialog(
  //       title: "Success",
  //       middleText: "Assets updated successfully",
  //       textConfirm: "OK",
  //       confirmTextColor: Colors.white,
  //       onConfirm: () {
  //         Get.back(); // Close the dialog
  //       },
  //     );
  //   } else {
  //     Get.defaultDialog(
  //       title: "Error",
  //       middleText: "Could not update",
  //       textConfirm: "OK",
  //       confirmTextColor: Colors.white,
  //       onConfirm: () {
  //         Get.back(); // Close the dialog
  //       },
  //     );
  //   }
  // }
// }
