import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:groundlia/Pages/util/Constants.dart';
import 'package:clipboard/clipboard.dart';
import 'package:share/share.dart';

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

Widget Heading(String heading,BuildContext context){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      GestureDetector(
        onTap: (){
//          Navigator.of(context).pop(true);
//          Navigator.pushNamed(context, "/login");
        },
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(80.0)),
          child: Image.asset(
            "Assets/Images/appicon/Icon.png",
            height: 80.0,
          ),
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

Widget EnterGame(String heading,BuildContext context){
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, "/selectsport");
        },
        child: Container(
          margin: EdgeInsets.only(left: 10.0,top: 50.0),
          padding: EdgeInsets.all(10.0),
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
      ),
    ],
  );
}

Widget showCodes(String code,String write,double width, BuildContext context){
  return Container(
    decoration: BoxDecoration(
      color: Colors.greenAccent[400],
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),
    margin: EdgeInsets.only(top: 20.0),
    padding: EdgeInsets.all(10.0),
    width: width - 50.0,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          write,
          style: TextStyle(
            fontSize: 30.0,
            fontFamily: "mainfont",
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                  onTap: () async {
                    Share.share("Hey There, join us on Groundlia with the $write" , subject: "Hey There, join us on Groundlia with the $write");
              },
              child: Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0,top: 5.0,bottom: 5.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Icon(Icons.send),
              ),
            ),
            GestureDetector(
              onTap: () {
                FlutterClipboard.copy(code).then(( value ) {
                  Fluttertoast.showToast(
                      msg: "Copied to Clipboard",
                      backgroundColor: Colors.black,
                      textColor: Colors.white);
                });
              },
              child: Container(
                margin: EdgeInsets.only(left: 10.0),
                padding: EdgeInsets.only(left: 10.0, right: 10.0,top: 5.0,bottom: 5.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Icon(Icons.copy),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Widget Indicator(double width,String name){
  return Container(
    width: width-50,
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.only(left: 5.0,right: 5.0),
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            name,
            maxLines: 1,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15.0,
            ),
          ),
        ),
      ),
    ),
  );
}

Future<bool> toast(String msg){
  return Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Colors.black,
      textColor: Colors.white);
}