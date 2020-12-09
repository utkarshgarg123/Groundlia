import 'package:flutter/material.dart';
import 'file:///D:/myapps/groundlia/lib/Pages/volunteer/PlayCricket.dart';
import 'package:groundlia/Pages/SplashScreen.dart';
import 'file:///D:/myapps/groundlia/lib/Pages/volunteer/SportsSelectionScreen.dart';
import 'package:groundlia/Pages/done.dart';
import 'package:groundlia/Pages/login.dart';
import 'package:groundlia/Pages/signup.dart';
import 'package:groundlia/Pages/startevent.dart';
import 'package:groundlia/Pages/watcher/watchbadminton.dart';
import 'package:groundlia/Pages/watcher/watchbasketball.dart';
import 'package:groundlia/Pages/watcher/watchcricket.dart';
import 'package:groundlia/Pages/watcher/watchwhich.dart';

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
  "/playCricket" : (BuildContext context) => PlayCricket(),
  "/selectsport" : (BuildContext context) => SelectSport(),
  "/watchwhich" : (BuildContext context) => watchwhich(),
  "/watchcricket" : (BuildContext context) => watchcricket(data1),
  "/watchbasketball" : (BuildContext context) => watchbasketball(data1),
  "/watchbadminton" : (BuildContext context) => watchbadminton(data1),
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
