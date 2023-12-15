import 'dart:ffi';

import 'package:asm_gegadyne/controllers/login_controllers.dart';
import 'package:asm_gegadyne/screens/user_details_screen.dart';
import 'package:asm_gegadyne/utils/toast_notify.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  final loginController c = Get.put(loginController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("email:${c.emailId} ");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Gegadyne Login.."),
        shadowColor: const Color.fromARGB(255, 117, 198, 25),
        backgroundColor: const Color.fromARGB(255, 159, 237, 70),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Center(
                    child: Container(
                        width: 250,
                        height: 200,
                        /*decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(50.0)),*/
                        child: Image.asset('assets/gegadyne_logo.jpg')),
                  ),
                ),
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: emailController,
                    onChanged: (value) {
                      c.emailId.value = emailController.text;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        labelText: 'Email',
                        hintText: 'user_id@gegadyne.com'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        // toast("Email and password cannot be empty");
                        return 'Please enter valid email';
                      }
                      // Add additional email validation if needed
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: passController,
                    onChanged: (value) {
                      c.password.value = passController.text;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        labelText: 'Password',
                        hintText: 'Enter secure password'),
                  ),
                ),
                SizedBox(height: 50),
                Shimmer(
                  duration: Duration(seconds: 2),
                  // This is NOT the default value. Default value: Duration(seconds: 0)
                  interval: Duration(seconds: 1),
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
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(30)),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            await c.loginUser(context);
                          } catch (err) {
                            // Show error dialog for incorrect credentials
                            Get.defaultDialog(
                              title: "Error",
                              middleText: "Email and password are incorrect",
                              textConfirm: "OK",
                              confirmTextColor: Colors.white,
                              onConfirm: () {
                                Get.back(); // Close the dialog
                              },
                            );
                            return;
                          }
                          await Get.to(UserDetailsScreen(),
                              transition: Transition.rightToLeftWithFade);
                          // Fluttertoast.showToast(msg: "Logged in successfully");
                          // toast("Logged in successfully");
                        } else {
                          toast('Please fill the credentials correctly');
                        }
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              'Login',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25),
                            ),
                          ),
                          Icon(
                            Icons.energy_savings_leaf,
                            color: Color.fromARGB(255, 78, 225, 83),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 130,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
