import 'dart:convert';

import 'package:asm_gegadyne/controllers/app_controllers.dart';
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
  }

  Future<void> fetchAssetById() async {
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
      // Map<String, dynamic> position = data[0];

      // Map<String, dynamic> keyValue = position[0];
    }
  }
}
