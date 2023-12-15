import 'dart:convert';

import 'package:asm_gegadyne/controllers/app_controllers.dart';
import 'package:asm_gegadyne/controllers/assets_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AssetsEditController extends GetxController {
  final AssestsController ac = Get.put(AssestsController());
  RxString updateStatus = "".obs;
  RxString firstName = "${AppController.firstName}".obs;
  RxString ram = "${AppController.ram}".obs;
  RxString lastName = "${AppController.lastName}".obs;
  RxString id = "${AppController.aid}".obs;
  RxString empId = "${AppController.aempId}".obs;
  RxString isActive = "${AppController.isActive}".obs;
  RxString make = "${AppController.make}".obs;
  RxString serialNo = "${AppController.serialNo}".obs;
  RxString assetTag = "${AppController.assetTag}".obs;
  RxString imeiNo = "${AppController.imeiNo}".obs;
  RxString OSversion = "${AppController.OSversion}".obs;
  RxString SSD = "${AppController.SSD}".obs;

  RxString processor = "${AppController.processor}".obs;
  RxString lanMacAddress = AppController.lanMacAddress ?? "".obs;
  RxString wifiMacAddress = "${AppController.wifiMacAddress}".obs;
  RxString approvalStatus = "${AppController.approvalStatus}".obs;

  Future<void> editAssetPost() async {
    http.Response response = await http.post(
      Uri.parse('http://192.168.100.45:4000/api/assets/fetchAssetById'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppController.accessToken}',
      },
      body: json.encode({
        {
          // "id": id.value.toString(),
          // "emp_Id": empId.value.toString(),
          // "make": make.value.toString(),
          // "serialNo": serialNo.value.toString(),
          // "assetTag": assetTag.value.toString(),
          // "imeiNo": imeiNo.value.toString(),
          // "OSversion": OSversion.value.toString(),
          // "SSD": SSD.value.toString(),
          // "ram": ram.value.toString(),
          // "processor": processor.value.toString(),
          // "lanMacAddress": ram.value.toString(),
          // "wifiMacAddress": wifiMacAddress.value.toString(),
          // "approvalStatus": approvalStatus.value.toString()

          "id": "${AppController.aid}",
          "emp_Id": "${AppController.aempId}",
          "make": "${AppController.make}",
          "serialNo": "${AppController.serialNo}",
          "assetTag": "${AppController.assetTag}",
          "imeiNo": "${AppController.imeiNo}",
          "OSversion": "${AppController.OSversion}",
          "SSD": "${AppController.SSD}",
          "ram": "${AppController.ram}",
          "processor": "${AppController.processor}",
          "lanMacAddress": "${AppController.lanMacAddress}",
          "wifiMacAddress": "${AppController.wifiMacAddress}",
          "approvalStatus": "${AppController.approvalStatus}",
        }
      }),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> result = json.decode(response.body);
      updateStatus = result['message'];
    }
  }
}
