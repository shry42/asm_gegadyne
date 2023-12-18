import 'dart:convert';

import 'package:asm_gegadyne/controllers/app_controllers.dart';
import 'package:asm_gegadyne/utils/toast_notify.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PasswordController extends GetxController {
  RxString newPassword = "".obs;
  RxString confirmPssword = "".obs;

// RxString emailId = AppController.emailId;

  Future<void> changePassword() async {
    http.Response response = await http.post(
      Uri.parse('http://192.168.100.45:4000/api/users/updatePassword'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppController.accessToken}',
      },
      body: json.encode({
        // "id": id.value.toString(),
        // "emp_Id": empId.value.toString(),
        "newPassword": newPassword.value,
        "confirmPassword": confirmPssword.value,
      }),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> result = json.decode(response.body);
      // updateStatus = result['message'];
      bool? status = result['status'];

      if (status == true) {
        toast("Pssword changed Successfully");
      } else {
        toast("Unable to change password");
      }
    } else {
      toast("Something went wrong");
    }
  }
}
