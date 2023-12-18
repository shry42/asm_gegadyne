import 'dart:convert';

import 'dart:math';

import 'package:asm_gegadyne/api_services/api_service.dart';
import 'package:asm_gegadyne/controllers/app_controllers.dart';
import 'package:asm_gegadyne/models/user_model.dart';
import 'package:asm_gegadyne/screens/user_details_screen.dart';
import 'package:asm_gegadyne/utils/toast_notify.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class loginController extends GetxController {
  RxString emailId = ''.obs;
  RxString password = ''.obs;
  User? user;
  String token = "";
  String role = "";

  Future<void> loginUser(BuildContext context) async {
    // throw Exception();
    http.Response response = await http.post(
      Uri.parse('http://192.168.100.45:4000/api/users/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "emailId": emailId.value,
        "password": password.value,
        // "emailId": "Superadmin@gegadyne.com",
        // "password": "Pass@123",
        // "emailId": "shravan.y@gegadyne.com",
        // "password": "Pass@123",
      }),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> result = json.decode(response.body);
      user = User.fromJson(result['userDetails']);
      // List userValue = result['userDeatils'];
      // emailId.value = userValue[0]['emailId'];

      token = result['token'];
      AppController.setaccessToken(token);

      role = user!.role;
      AppController.setRole(role);
    } else {
      toast("Please check Credentials properly!");
    }
  }

  void logout() {
    user = null;
    token = "";
    emailId.value = "";
    password.value = "";
    role = "";
    AppController.setaccessToken("");
    AppController.setRole("");
  }
}


//BELOW IS THE MOCK API
// import 'dart:convert';
// import 'package:asm_gegadyne/controllers/app_controllers.dart';
// import 'package:asm_gegadyne/models/user_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class loginController extends GetxController {
//   RxString emailId = ''.obs;
//   RxString password = ''.obs;
//   User? user;
//   String token = "";
//   String role = "";

  
//   Future<void> simulateLogin() async {
//     // Simulated response data (the provided response)
//     final simulatedResponse = {
//       "status": true,
//       "message": " login Successfully",
//       "token":
//           "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImVtYWlsIjoic3VwZXJhZG1pbkBnZWdhZHluZS5jb20iLCJpZCI6Miwicm9sZSI6IlN1cGVyYWRtaW4ifSwiaWF0IjoxNzAyNDY0NTExLCJleHAiOjE3MDI1NTA5MTF9._MSiwRLQYfK3fV3yvZtg01tf7XDPDDTmw2irRzXAci4",
//       "userDetails": {
//         "id": 2,
//         "firstName": "superUser",
//         "lastName": "admin",
//         "emailId": "superadmin@gegadyne.com",
//         "role": "Superadmin"
//       }
//     };

//     // Process the simulated response as if it came from an API request
//     if (simulatedResponse['status'] == true) {
//       user = User.fromJson(simulatedResponse['userDetails'] as Map<String, dynamic>);
//       token = simulatedResponse['token'] as String;
//       AppController.setaccessToken(token);
//       role = user!.role;
//       AppController.setRole(role);
//     }
//   }
// }
