import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:groundlia/Pages/util/Constants.dart';

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

Widget Heading(String heading){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(80.0)),
        child: Image.asset(
          "Assets/Images/appicon/Icon.png",
          height: 80.0,
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 10.0),
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        decoration: BoxDecoration(
          color: Colors.greenAccent[400],
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Center(
          child: Text(
            heading,
            style: kHeadingTextStyle,
          ),
        ),
      ),
    ],
  );
}