import 'package:asm_gegadyne/screens/login_page.dart';
import 'package:asm_gegadyne/utils/toast_notify.dart';
import 'package:flutter/material.dart';
import 'package:pin_lock_screen/pin_lock_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PinSetupOrLockScreen extends StatefulWidget {
  @override
  _PinSetupOrLockScreenState createState() => _PinSetupOrLockScreenState();
}

class _PinSetupOrLockScreenState extends State<PinSetupOrLockScreen> {
  bool isPinSet = false;
  dynamic storedPin;

  @override
  void initState() {
    super.initState();
    checkIfPinIsSet();
  }

  Future<void> checkIfPinIsSet() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isPinSet = prefs.containsKey('pin');

    if (!isPinSet) {
      showSetPinDialog(); // If PIN is not set, show the dialog to set it
    }
    setState(() {
      storedPin = prefs.getInt('pin');
    });
  }

  Future<void> showSetPinDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        String enteredPin = '';
        String confirmedPin = '';

        return AlertDialog(
          title: Text('Set PIN'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Enter a PIN to access the app:'),
                TextFormField(
                  obscureText: true,
                  maxLength: 4,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'PIN',
                    hintText: 'Enter a 4-digit PIN',
                  ),
                  onChanged: (value) {
                    enteredPin = value;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  obscureText: true,
                  maxLength: 4,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirm PIN',
                    hintText: 'Re-enter the 4-digit PIN',
                  ),
                  onChanged: (value) {
                    confirmedPin = value;
                  },
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (enteredPin.length == 4 && enteredPin == confirmedPin) {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setInt('pin', int.parse(enteredPin));
                      Navigator.of(context).pop();
                      checkIfPinIsSet();
                      setState(() {
                        isPinSet = true;
                      });
                    } else {
                      toast("pin mismatch");
                    }
                  },
                  child: Text('Set PIN'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isPinSet) {
      return PinLockScreen(
        correctPin:
            storedPin, // Replace with the actual correct PIN set by the user
        // Other PinLockScreen properties...
        filledPinDotColor: Colors.white,
        onPinMatched: (pin) {
          // Handle logic when the entered PIN matches the correct PIN
          print('Entered PIN is correct: $pin');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        },
        pinLength: 4,
        // Other PinLockScreen properties...
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}

// class LoginScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Center(
//         child: Text('This is the Login Screen'),
//       ),
//     );
//   }
// }
