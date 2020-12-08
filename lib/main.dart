import 'package:flutter/material.dart';
import 'package:groundlia/Pages/PlayCricket.dart';
import 'package:groundlia/Pages/SplashScreen.dart';
import 'package:groundlia/Pages/SportsSelectionScreen.dart';
import 'package:groundlia/Pages/done.dart';
import 'package:groundlia/Pages/login.dart';
import 'package:groundlia/Pages/signup.dart';
import 'package:groundlia/Pages/startevent.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: StartTheApp(),
    routes: routes,
  ));
}

var routes = <String,WidgetBuilder>{
  "/splash": (BuildContext context) => StartTheApp(),
  "/login": (BuildContext context) => login(),
  "/signup" : (BuildContext context) => signup(),
  "/done" : (BuildContext context) => Done(data1),
  "/startevent" : (BuildContext context) => Startevent(data2),
  "/play" : (BuildContext context) => PlayCricket(),
  "/here" : (BuildContext context) => SelectSport(),
};

class StartTheApp extends StatefulWidget {
  @override
  _StartTheAppState createState() => _StartTheAppState();
}

class _StartTheAppState extends State<StartTheApp> {
  @override
  Widget build(BuildContext context) {
    return Splashscreen();
  }
}
