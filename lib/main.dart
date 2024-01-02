import 'package:asm_gegadyne/Authentication_services/autentication_screen.dart';
import 'package:asm_gegadyne/screens/app_lock.dart';
import 'package:asm_gegadyne/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: Get.key,
      // initialBinding: BindingsBuilder(() {
      //   Get.put(loginController());
      // }),
      title: 'asm_gegadyne',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const LoginPage(),
      //For app lock
      // home: PinSetupOrLockScreen(),
      // For system app lock
      home: AuthScreen(),
    );
  }
}
