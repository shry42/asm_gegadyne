import 'package:asm_gegadyne/api_services/api_service_main.dart';
import 'package:asm_gegadyne/controllers/app_controllers.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class loginController extends GetxController {
  RxString emailId = ''.obs;
  RxString password = ''.obs;

  @override
  void initState() {
    //
    login();
    super.onInit();
  }

  Dio dio = Dio();

  Future<void> login() async {
    try {
      final response = await dio.post(
        // API.LOGIN,
        'http://192.168.100.45:4000/api/users/login',
        data: {
          "emailId": 'Superadmin@gegadyne.com',
          "password": 'Pass@123',
        },
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;

        String token = data['token'];
        print(token);

        // var responseBody = response.data;
        // var data = responseBody['result']['data'];
        // AppController.setaccessToken(data['token']);
      }
    } catch (e) {
      print(e);
    }
  }
}
