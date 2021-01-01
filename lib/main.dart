import 'package:flutter/material.dart';
import 'package:groundlia/Pages/Extra/previous_login.dart';
import 'package:groundlia/Pages/SplashScreen.dart';
import 'package:groundlia/Pages/volunteer/SportsSelectionScreen.dart';
import 'package:groundlia/Pages/done.dart';
import 'package:groundlia/Pages/login.dart';
import 'package:groundlia/Pages/signup.dart';
import 'package:groundlia/Pages/startevent.dart';
import 'package:groundlia/Pages/volunteer/badminton/badminton_new_game.dart';
import 'package:groundlia/Pages/volunteer/badminton/badminton_update_score.dart';
import 'package:groundlia/Pages/volunteer/basketball/Basketball_update_score.dart';
import 'package:groundlia/Pages/volunteer/basketball/basketball_new_game.dart';
import 'package:groundlia/Pages/volunteer/cricket/cricket_new_game.dart';
import 'package:groundlia/Pages/volunteer/cricket/cricket_update_score.dart';
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
  "/relogin": (BuildContext context) => Relogin(data1,CODES),
  "/signup" : (BuildContext context) => signup(data1),
  "/done" : (BuildContext context) => Done(data1),
  "/startevent" : (BuildContext context) => Startevent(data2,codes,CODES),
  "/selectsport" : (BuildContext context) => SelectSport(),
  "/watchwhich" : (BuildContext context) => watchwhich(data1),
  "/watchcricket" : (BuildContext context) => watchcricket(data1,cricketScore),
  "/watchbasketball" : (BuildContext context) => watchbasketball(data1,basketballScore),
  "/watchbadminton" : (BuildContext context) => watchbadminton(data1,badminonScore),
  "/newbadminton": (BuildContext context) => BadmintonNewGame(data1,data2),
  "/updatebadminton": (BuildContext context)=> BadmintonUpdateScore(data1,data2),
  "/newbasketball": (BuildContext context) => BasketballNewGame(data1,data2),
  "/updatebasketball": (BuildContext context)=> BasketballUpdateScore(data1,data2),
  "/newcricket": (BuildContext context) => CricketNewGame(data1,data2),
  "/updatecricket": (BuildContext context)=> CricketUpdateScore(data1,data2),
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
