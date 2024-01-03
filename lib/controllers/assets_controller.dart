import 'dart:convert';

import 'package:asm_gegadyne/controllers/app_controllers.dart';
import 'package:asm_gegadyne/controllers/assets_edit_controller.dart';
import 'package:asm_gegadyne/models/asset_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AssestsController extends GetxController {
  List<Asset> assets = [];
  String active = "";
  Asset? asset;
  RxString id = ''.obs;
  RxString empId = ''.obs;

  @override
  void initState() {
    fetchAssetById();
    super.onInit();
  }

  Future<List<Asset>> fetchAssetById() async {
    http.Response response = await http.post(
      Uri.parse('http://192.168.100.45:4000/api/assets/fetchAssetById'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppController.accessToken}',
      },
      body: json.encode({
        "qrvalue": {
          "id": AppController.id,
          "emp_id": AppController.empId,
          // "id": '1',
          // "emp_id": '2',
        }
      }),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> result = json.decode(response.body);
      List<dynamic> data = result['data'];
      assets = data.map((item) => Asset.fromJson(item)).toList();

      final AssetsEditController editAssetController =
          Get.put(AssetsEditController());
      editAssetController.firstName.value = assets[0].firstName;
      editAssetController.lastName.value = assets[0].lastName;

      editAssetController.make.value = assets[0].make;

      editAssetController.type.value = assets[0].type;

      editAssetController.model.value = assets[0].model;

      editAssetController.assetHandOverDate.value =
          assets[0].assetHandOverDate.toString();

      editAssetController.serialNo.value = assets[0].serialNo;

      editAssetController.id.value = assets[0].id.toString();

      editAssetController.empId.value = assets[0].empId.toString();

      editAssetController.assetTag.value = assets[0].assetTag;

      editAssetController.imeiNo.value = assets[0].imeiNo;

      editAssetController.OSversion.value = assets[0].osVersion;

      editAssetController.SSD.value = assets[0].ssd;

      editAssetController.ram.value = assets[0].ram;
      editAssetController.processor.value = assets[0].processor;

      editAssetController.lanMacAddress.value = assets[0].lanMacAddress;

      editAssetController.wifiMacAddress.value = assets[0].wifiMacAddress;

      editAssetController.approvalStatus.value = assets[0].approvalStatus;

      editAssetController.isActive.value = assets[0].isActive.toString();

      editAssetController.createdAt.value = assets[0].createdAt;

      editAssetController.createdBy.value = assets[0].createdBy.toString();

      return assets;
    } else {
      return [];
    }
  }

  //MOCKED RESPONSE BELOW

  // Future<List<Asset>> fetchAssetById() async {
  //   // Simulated response data (mocked response similar to the provided data)
  //   final simulatedResponse = {
  //     "data": [
  //       {
  //         "id": 2,
  //         "emp_Id": 1,
  //         "make": "Macbook AIr Pro",
  //         "serialNo": "jhk",
  //         "assetTag": "kjh",
  //         "imeiNo": "khk",
  //         "OSversion": "hkj",
  //         "SSD": "hj",
  //         "ram": "hkjh",
  //         "processor": "kjh",
  //         "lanMacAddress": "kjh",
  //         "wifiMacAddress": "kjh",
  //         "approvalStatus": "Yes",
  //         "createdBy": 1,
  //         "isActive": 1,
  //         "timestamp": {
  //           "type": "Buffer",
  //           "data": [0, 0, 0, 0, 0, 0, 164, 21]
  //         },
  //         "createdAt": "2023-12-12T18:50:47.433Z",
  //         "firstName": "shravan",
  //         "lastName": "yadav"
  //       }
  //     ],
  //     "status": true,
  //     "message": "Asset Details Found Successfully"
  //   };

  //   // Process the simulated response as if it came from an API request
  //   if (simulatedResponse['status'] == true) {
  //     List<dynamic> data = simulatedResponse['data'] as List<dynamic> ?? [];
  //     assets = data.map((item) => Asset.fromJson(item)).toList();
  //     final AssetsEditController editAssetController =
  //         Get.put(AssetsEditController());
  //     editAssetController.firstName.value = assets[0].firstName;
  //     editAssetController.lastName.value = assets[0].lastName;

  //     editAssetController.make.value = assets[0].make;

  //     editAssetController.serialNo.value = assets[0].serialNo;

  //     editAssetController.id.value = assets[0].id.toString();

  //     editAssetController.empId.value = assets[0].empId.toString();

  //     editAssetController.assetTag.value = assets[0].assetTag;

  //     editAssetController.imeiNo.value = assets[0].imeiNo;

  //     editAssetController.OSversion.value = assets[0].osVersion;

  //     editAssetController.SSD.value = assets[0].ssd;

  //     editAssetController.ram.value = assets[0].ram;
  //     editAssetController.processor.value = assets[0].processor;

  //     editAssetController.lanMacAddress.value = assets[0].lanMacAddress;

  //     editAssetController.wifiMacAddress.value = assets[0].wifiMacAddress;

  //     editAssetController.approvalStatus.value = assets[0].approvalStatus;

  //     editAssetController.isActive.value = assets[0].isActive.toString();

  //     editAssetController.createdAt.value = assets[0].createdAt;

  //     editAssetController.createdBy.value = assets[0].createdBy.toString();

  //     return assets;
  //   } else {
  //     return [];
  //   }
  // }
}
