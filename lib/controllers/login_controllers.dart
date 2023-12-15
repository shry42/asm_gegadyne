import 'dart:convert';

import 'dart:math';

import 'package:asm_gegadyne/api_services/api_service.dart';
import 'package:asm_gegadyne/controllers/app_controllers.dart';
import 'package:asm_gegadyne/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class loginController extends GetxController {
  RxString emailId = ''.obs;
  RxString password = ''.obs;
  User? user;
  String token = "";

  Future<void> loginUser(BuildContext context) async {
    // throw Exception();
    http.Response response = await http.post(
      Uri.parse('http://192.168.100.45:4000/api/users/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "emailId": emailId.value,
        "password": password.value,
        // "emailId": "Shravan.y@gegadyne.com",
        // "password": "Pass@123",
      }),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> result = json.decode(response.body);
      user = User.fromJson(result['userDetails']);
      token = result['token'];
      AppController.setaccessToken(token);
    }
  }

  // Future<void> login() async {
  //   try {
  //     final response = await dio.post(
  //       // API.LOGIN,
  //       'http://192.168.100.45:4000/api/users/login',
  //       data: {
  //         "emailId": 'Superadmin@gegadyne.com',
  //         "password": 'Pass@123',
  //       },
  //       options: Options(headers: {'Content-Type': 'application/json'}),
  //     );

  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> data = response.data;

  //       String token = data['token'];
  //       print(token);

  //       // var responseBody = response.data;
  //       // var data = responseBody['result']['data'];
  //       // AppController.setaccessToken(data['token']);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
