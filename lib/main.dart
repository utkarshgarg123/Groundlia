import 'package:flutter/material.dart';
import 'package:groundlia/Pages/SplashScreen.dart';
import 'package:groundlia/Pages/signup.dart';
import 'Pages/login.dart';

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