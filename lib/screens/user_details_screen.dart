import 'package:asm_gegadyne/controllers/login_controllers.dart';
import 'package:asm_gegadyne/screens/qr_scanner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class UserDetailsScreen extends StatefulWidget {
  UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  final loginController userData = Get.put(loginController());

  @override
  void initState() {
    // TODO: implement initState
    userData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // String name = 'Shravan Yadav';
    // String email = 'Shravan.y@gegadyne.com';
    // String role = 'Superadmin';
    String barcodeImageURL = "assets/scanner.gif";
    // String accessToken = "";
    // 'assets/qr_scanner.png'; // Replace with actual barcode image URL

    // if (userData.user == null) {
    //   return Scaffold(
    //     body: Center(
    //       child: CircularProgressIndicator(),
    //     ),
    //   );
    // }
    // if(userData.user!=null){
    //   AppController.setaccessToken(userData.user.)
    // }

    return WillPopScope(
      onWillPop: () async {
        return await Get.defaultDialog(
          backgroundColor: const Color.fromARGB(255, 201, 239, 157),
          title: "Exit?",
          middleText: "Are you sure? You'll be logged",
          textConfirm: 'Yes',
          textCancel: 'No',
          onConfirm: () {
            Get.back(result: true);
          },
          onCancel: () {
            Get.back(result: false);
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Scan QR Code'),
          backgroundColor: Colors.lightGreen,
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
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
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 700,
                    width: 385,
                    // color: Colors.white,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(26, 255, 255, 255),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      border: Border.all(color: Colors.white60),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //Person icon
                        const Icon(
                          Icons.person,
                          size: 150,
                        ),
                        // Deatils
                        Text(
                          userData.user!.role,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${userData.user!.firstName} ${userData.user!.lastName}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          userData.user!.emailId,
                          style: const TextStyle(
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
                          duration: const Duration(seconds: 2),
                          // This is NOT the default value. Default value: Duration(seconds: 0)
                          interval: const Duration(milliseconds: 500),
                          // This is the default value
                          color: Colors.white,
                          // This is the default value
                          colorOpacity: 1,
                          // This is the default value
                          enabled: true,
                          // This is the default value
                          direction: const ShimmerDirection.fromLTRB(),
                          child: Container(
                            height: 50,
                            width: 200,
                            decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(30)),
                            child: ElevatedButton(
                              onPressed: () {
                                //
                                Get.to(const QRScannerScreen(),
                                    transition: Transition.fade,
                                    duration:
                                        const Duration(milliseconds: 200));
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
