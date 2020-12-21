import 'package:flutter/material.dart';
import 'package:groundlia/Pages/volunteer/CricketScoreBoard.dart';
import 'package:groundlia/Pages/volunteer/PlayCricket.dart';
import 'package:groundlia/Pages/SplashScreen.dart';
import 'package:groundlia/Pages/volunteer/SportsSelectionScreen.dart';
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
    home:
        StartTheApp(),
//     CricketScoreBoard(),
     routes: routes,
  ));
}

var routes = <String,WidgetBuilder>{
  "/splash": (BuildContext context) => StartTheApp(),
  "/login": (BuildContext context) => login(),
  "/signup" : (BuildContext context) => signup(),
  "/done" : (BuildContext context) => Done(data1),
  "/cricketedit" : (BuildContext context) => CricketScoreBoard(),
  "/startevent" : (BuildContext context) => Startevent(data2,codes),
  "/playCricket" : (BuildContext context) => PlayCricket(file),
//  "/editcricket" : (BuildContext context) => CricketScoreBoard(),
  "/selectsport" : (BuildContext context) => SelectSport(),
  "/watchwhich" : (BuildContext context) => watchwhich(data1),
  "/watchcricket" : (BuildContext context) => watchcricket(data1,CricketScore),
  "/watchbasketball" : (BuildContext context) => watchbasketball(data1,BasketBallScore),
  "/watchbadminton" : (BuildContext context) => watchbadminton(data1,BadmintonScore),
//  "/EditBadminton" : (BuildContext context) => BadmintonScoreBoard(file),
//  "/EditBasketball" : (BuildContext context) => BasketballScoreBoard(file),
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
