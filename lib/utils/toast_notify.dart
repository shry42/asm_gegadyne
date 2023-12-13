import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toast(String message) {
  Fluttertoast.showToast(msg: message);
}
