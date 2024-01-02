import 'package:flutter/material.dart';
import 'package:pin_lock_screen/pin_lock_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PinSetupOrLockScreen extends StatefulWidget {
  @override
  _PinSetupOrLockScreenState createState() => _PinSetupOrLockScreenState();
}

class _PinSetupOrLockScreenState extends State<PinSetupOrLockScreen> {
  bool isPinSet = false;

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
    setState(() {});
  }

  Future<void> showSetPinDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        String enteredPin = '';

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
                ElevatedButton(
                  onPressed: () async {
                    if (enteredPin.length == 4) {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setString('pin', enteredPin);
                      Navigator.of(context).pop();
                      await checkIfPinIsSet();
                    } else {
                      // Handle incorrect PIN length
                      // Show a snackbar or error message
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
        correctPin: 1111, // Replace with the actual correct PIN set by the user
        // Other PinLockScreen properties...
        onPinMatched: (pin) {
          // Handle logic when the entered PIN matches the correct PIN
          print('Entered PIN is correct: $pin');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        }, pinLength: 4,
        // Other PinLockScreen properties...
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(), // Show loading indicator while checking PIN setup
        ),
      );
    }
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Text('This is the Login Screen'),
      ),
    );
  }
}