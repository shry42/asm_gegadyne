import 'package:asm_gegadyne/screens/user_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Gegadyne Login.."),
        shadowColor: const Color.fromARGB(255, 117, 198, 25),
        backgroundColor: const Color.fromARGB(255, 159, 237, 70),
      ),
      body: SingleChildScrollView(
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
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: 'Email',
                      hintText: 'user_id@gegadyne.com'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
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
                    onPressed: () {
                      //
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Get.to(UserDetailsScreen());
                            },
                            child: const Text(
                              'Login',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25),
                            ),
                          ),
                        ),
                        const Icon(
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
    );
  }
}
