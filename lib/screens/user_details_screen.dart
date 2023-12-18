import 'package:asm_gegadyne/controllers/app_controllers.dart';
import 'package:asm_gegadyne/controllers/login_controllers.dart';
import 'package:asm_gegadyne/screens/qr_scanner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class UserDetailsScreen extends StatelessWidget {
  final loginController userData = Get.put(loginController());

  @override
  Widget build(BuildContext context) {
    // String name = 'Shravan Yadav';
    // String email = 'Shravan.y@gegadyne.com';
    // String role = 'Superadmin';
    String barcodeImageURL = "assets/scanner.gif";
    // String accessToken = "";
    // 'assets/qr_scanner.png'; // Replace with actual barcode image URL

    if (userData.user == null) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    // if(userData.user!=null){
    //   AppController.setaccessToken(userData.user.)
    // }

    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Scan QR Code'),
          backgroundColor: Colors.lightGreen,
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.lightGreen,
                  Colors.white70,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
                  0.0,
                  1.0,
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 700,
                    width: 385,
                    // color: Colors.white,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(26, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      border: Border.all(color: Colors.white60),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //Person icon
                        Icon(
                          Icons.person,
                          size: 150,
                        ),
                        // Deatils
                        Text(
                          "${userData.user!.role}",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${userData.user!.firstName} ${userData.user!.lastName}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          userData.user!.emailId,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        //Scanner
      
                        SizedBox(
                          child: Image.asset(
                            barcodeImageURL,
                            height: 250,
                            width: 190,
                          ),
                        ),
      
                        //scanner Button
      
                        Shimmer(
                          duration: Duration(seconds: 2),
                          // This is NOT the default value. Default value: Duration(seconds: 0)
                          interval: Duration(milliseconds: 500),
                          // This is the default value
                          color: Colors.white,
                          // This is the default value
                          colorOpacity: 1,
                          // This is the default value
                          enabled: true,
                          // This is the default value
                          direction: ShimmerDirection.fromLTRB(),
                          child: Container(
                            height: 50,
                            width: 200,
                            decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(30)),
                            child: ElevatedButton(
                              onPressed: () {
                                //
                                Get.to(QRScannerScreen(),
                                    transition: Transition.fade,
                                    duration: Duration(milliseconds: 200));
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.flip_camera_ios,
                                    color: Colors.black,
                                  ),
                                  Center(
                                    child: Text(
                                      'Scan QR',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 25),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
