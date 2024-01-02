import 'dart:convert';
import 'package:asm_gegadyne/controllers/app_controllers.dart';
import 'package:asm_gegadyne/models/asset_make_model.dart';
import 'package:asm_gegadyne/models/type_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class typeController extends GetxController {
  List<typeModel> typeList = [];

  Future<List<typeModel>> fetchTypeList() async {
    final response = await http.post(
      Uri.parse('http://192.168.100.45:4000/api/assets/fetchType'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppController.accessToken}',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      final List<dynamic> dataList = jsonResponse['data'];
      typeList = dataList.map((item) => typeModel.fromJson(item)).toList();

      return typeList;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
