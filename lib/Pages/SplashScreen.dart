import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

//  String random_img;

  @override
  void initState() {
    Timer(Duration(seconds: 5), (){
      Navigator.of(context).pop(true);
      Navigator.pushNamed(context, "/login");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height/2,
                width: MediaQuery.of(context).size.width - 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  child: Image.asset("Assets/Images/appicon/Icon.png", height: 120.0,),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Groundlia",style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: "mainfont",
                  ),),
                ],
              ),
              Container(
                padding: EdgeInsets.only(right: 25.0),
                child: Column(
                  children: [

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}