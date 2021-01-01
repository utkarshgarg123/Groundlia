import 'dart:async';

import 'package:flutter/material.dart';
import 'package:groundlia/Pages/Api/download.dart';
import 'package:groundlia/Pages/Api/storing_locally.dart';
import 'package:groundlia/Pages/Api/upload.dart';
import 'package:groundlia/Pages/Extra/loading_container.dart';
import 'package:groundlia/Pages/Scores/cricket_score.dart';
import 'package:groundlia/Pages/util/Constants.dart';
import 'package:groundlia/Pages/util/Data.dart';
import 'package:groundlia/Pages/volunteer/cricket/cricket_score_displayer.dart';

class CricketUpdateScore extends StatefulWidget {
  LData data1;
  SData data2;
  CricketUpdateScore(this.data1, this.data2);

  @override
  _CricketUpdateScoreState createState() => _CricketUpdateScoreState();
}

class _CricketUpdateScoreState extends State<CricketUpdateScore> {
  bool isloading = true;
  Timer time;
  CricketScore Score = new CricketScore();
  final snackbar = SnackBar(
    content: Text("Updating . . ."),
    duration: Duration(seconds: 2),
  );
  final endgame = SnackBar(
    content: Text("Game Ends"),
    duration: Duration(seconds: 2),
  );
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    if(widget.data1.code == ""){
      widget.data1.code == widget.data2.OrganizerCode;
    }
    time = new Timer.periodic(Duration(seconds: 1), (Timer t) => Update());
    super.initState();
  }

  @override
  void dispose() {
    time.cancel();
    super.dispose();
  }

  void Update() async{
    download dn = download();
    saving sv = new saving();
    await sv.readfile().then((value) async {
      widget.data1.code = value["OrganizerCode"];
    });
    await dn.CricketScore(widget.data1).then((value) {
      Score.dataelements(value["data"]["Team_A"]["Members"],
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
    });
    setState((){isloading = false;});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.greenAccent[400],
          title: Text("Live Cricket"),
        ),
        body: (isloading)?loading_container():Container(
          color: Colors.grey[800],
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                    if(Score.data.teamA.mode == "batting") ShowScore(
                      score: Score,
                      i: 0,
                      width: MediaQuery.of(context).size.width,
                      cnxt: context,
                      setTheState: (int val){setState(() {Update();});},
                      onCallBack: (){setState(() {Update();}); print("here");},
                    )
                    else if(Score.data.teamB.mode == "batting") ShowScore(score: Score,
                      i: 1,
                      width: MediaQuery.of(context).size.width,
                      cnxt: context,
                      setTheState: (int val){setState(() {Update();});},
                      onCallBack: (){setState(() {Update();}); print("here");},
                    )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
