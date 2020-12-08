import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

DateTime backbuttonpressedTime;

Future<bool> onWillPop() async {
  DateTime currentTime = DateTime.now();
  bool backButton = backbuttonpressedTime == null ||
      currentTime.difference(backbuttonpressedTime) > Duration(seconds: 2);
  if (backButton) {
    backbuttonpressedTime = currentTime;
    Fluttertoast.showToast(
        msg: "Double Tap to exit",
        backgroundColor: Colors.black,
        textColor: Colors.white);
    return false;
  }
  return true;
}