import 'package:flutter/material.dart';
import 'package:groundlia/Pages/Api/storing_locally.dart';
import 'package:groundlia/Pages/Extra/loading_container.dart';
import 'package:groundlia/Pages/Scores/badminton_score.dart';
import 'package:groundlia/Pages/Scores/badminton_score.dart' as game_badminton;
import 'package:groundlia/Pages/Scores/basketball_score.dart';
import 'package:groundlia/Pages/Scores/cricket_score.dart';
import 'package:groundlia/Pages/util/Data.dart';
import 'package:groundlia/Pages/util/widget.dart';
import 'package:groundlia/Pages/Api/download.dart';

download dn = new download();
BasketballScore basketballScore = new BasketballScore();
BadmintonScore badminonScore = new BadmintonScore();
CricketScore cricketScore = new CricketScore();

class watchwhich extends StatefulWidget {
  LData data;
  watchwhich(this.data);

  @override
  _watchwhichState createState() => _watchwhichState();
}

class _watchwhichState extends State<watchwhich> {
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: (isloading)?loading_container():Container(
            width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.grey[900],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  padding: EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width - 50,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.watch_later_outlined,color: Colors.white,size: 35.0,),
                      Text("What to watch" ,style: TextStyle(
                        fontFamily: "mainfont",
                        fontSize: 35.0,
                      ),),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  padding: EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width - 50,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Center(child: Text("Choose the game" ,style: TextStyle(
                    fontFamily: "mainfont",
                    fontSize: 35.0,
                  ),)),
                ),
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      isloading = true;
                    });
                    badminonScore = new BadmintonScore();
                    await dn.CricketScore(widget.data).then((value){
                      cricketScore.dataelements(value["data"]["Team_A"]["Members"],
                        value["data"]["Team_A"]["Runs"].toString(),
                        value["data"]["Team_B"]["Members"],
                        value["data"]["Team_B"]["Runs"].toString(),
                        value["data"]["winner"].toString(),
                        value["data"]["new"].toString(),
                        value["data"]["Team_A"]["Wickets"].toString(),
                        value["data"]["Team_B"]["Wickets"].toString(),
                        value["data"]["Team_A"]["Mode"],
                        value["data"]["Team_B"]["Mode"],
                        value["data"]["overs"]
                      );
                      saving sav = new saving();
                      sav.readfile().then((val) {
                        cricketScore.orandlo(val["name"].toString(), val["location"].toString());
                      });
                    });
                    setState(() {
                      isloading = false;
                    });
                    Navigator.pushNamed(context, "/watchcricket");
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20.0),
                    padding: EdgeInsets.all(5.0),
                    width: MediaQuery.of(context).size.width - 100,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent[400],
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Center(child: Text("Cricket",style: TextStyle(
                      fontFamily: "mainfont",
                      fontSize: 35.0,
                    ),)),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      isloading = true;
                    });
                    badminonScore = new BadmintonScore();
                    await dn.BadmintonScore(widget.data).then((value){
                      badminonScore.dataelements(value["data"]["Team_A"]["Members"],
                          value["data"]["Team_A"]["Score"].toString(),
                          value["data"]["Team_B"]["Members"],
                          value["data"]["Team_B"]["Score"].toString(),
                          value["data"]["winner"].toString(),
                          value["data"]["new"].toString());
                      saving sav = new saving();
                      sav.readfile().then((val) {
                        badminonScore.orandlo(val["name"].toString(), val["location"].toString());
                      });
                    });
                    setState(() {
                      isloading = false;
                    });
                    Navigator.pushNamed(context, "/watchbadminton");
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20.0),
                    padding: EdgeInsets.all(5.0),
                    width: MediaQuery.of(context).size.width - 100,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent[400],
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Center(child: Text("Badminton",style: TextStyle(
                      fontFamily: "mainfont",
                      fontSize: 35.0,
                    ),)),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      isloading = true;
                    });
                    basketballScore = new BasketballScore();
                    await dn.BasketballScore(widget.data).then((value){
                      basketballScore.dataelements(value["data"]["Team_A"]["Members"],
                          value["data"]["Team_A"]["Score"].toString(),
                          value["data"]["Team_B"]["Members"],
                          value["data"]["Team_B"]["Score"].toString(),
                          value["data"]["winner"].toString(),
                          value["data"]["new"].toString());
                      saving sav = new saving();
                      sav.readfile().then((val) {
                        basketballScore.orandlo(val["name"].toString(), val["location"].toString());
                      });
                    });
                    setState(() {
                      isloading = false;
                    });
                    Navigator.pushNamed(context, "/watchbasketball");
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20.0),
                    padding: EdgeInsets.all(5.0),
                    width: MediaQuery.of(context).size.width - 100,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent[400],
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Center(child: Text("BasketBall",style: TextStyle(
                      fontFamily: "mainfont",
                      fontSize: 35.0,
                    ),)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(true);
                    Navigator.pushNamed(context, "/login");
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20.0),
                    padding: EdgeInsets.all(5.0),
                    width: MediaQuery.of(context).size.width - 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Center(child: Text("Back to login screen",style: TextStyle(
                      fontFamily: "mainfont",
                      fontSize: 30.0,
                    ),)),
                  ),
                ),
              ],
            ),
          ),
        ),
        onWillPop: onWillPop);
  }
}

