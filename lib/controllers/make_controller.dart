import 'dart:convert';
import 'package:asm_gegadyne/controllers/app_controllers.dart';
import 'package:asm_gegadyne/models/asset_make_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class makeController extends GetxController {
  List<AssetMake> makeList = [];

  Future<List<AssetMake>> fetchMakeList() async {
    final response = await http.post(
      Uri.parse('http://192.168.100.45:4000/api/assets/fetchMake'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppController.accessToken}',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      final List<dynamic> dataList = jsonResponse['data'];
      makeList = dataList.map((item) => AssetMake.fromJson(item)).toList();

      return makeList;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
