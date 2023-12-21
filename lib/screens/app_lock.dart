import 'package:asm_gegadyne/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_lock_screen/pin_lock_screen.dart';

class AppLockScreen extends StatelessWidget {
  const AppLockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PinLockScreen(
            correctPin: 1111,
            pinLength: 4,
            onPinMatched: (pin) {
              Get.to(const LoginPage());
            },
            onPinChanged: (pin) {},
            disableDotColor: const Color.fromARGB(255, 50, 50, 45),
            wrongPinDotColor: Colors.red,
            filledPinDotColor: Color.fromARGB(255, 80, 159, 20),
            buttonElevation: 3,
            dotsShape: BoxShape.circle,
            gapBtwDotsAndNumPad: 100,
            buttonBackgroundColor: Color.fromARGB(255, 118, 234, 89),
            buttonForegroundColor: Colors.white,
            buttonBorderRadius: 12,
            buttonSize: const Size(60.0, 60.0),
            numPadVerticalSpacing: 30,
            numPadHorizontalSpacing: 20,
          ),
        ],
      ),
    );
    ;
  }
}
