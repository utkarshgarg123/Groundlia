import 'dart:async';

import 'package:flutter/material.dart';
import 'package:groundlia/Pages/Api/download.dart';
import 'package:groundlia/Pages/Api/storing_locally.dart';
import 'package:groundlia/Pages/Api/upload.dart';
import 'package:groundlia/Pages/Extra/loading_container.dart';
import 'package:groundlia/Pages/Scores/badminton_score.dart';
import 'package:groundlia/Pages/util/Constants.dart';
import 'package:groundlia/Pages/util/Data.dart';

class BadmintonUpdateScore extends StatefulWidget {
  LData data1;
  SData data2;
  BadmintonUpdateScore(this.data1,this.data2);
  @override
  _BadmintonUpdateScoreState createState() => _BadmintonUpdateScoreState();
}

class _BadmintonUpdateScoreState extends State<BadmintonUpdateScore> {

  bool isloading = true;
  Timer time;
  String code;
  BadmintonScore Score = new BadmintonScore();
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
    await dn.BadmintonScore(widget.data1).then((value) {
      Score.dataelements(value["data"]["Team_A"]["Members"],
          value["data"]["Team_A"]["Score"].toString(),
          value["data"]["Team_B"]["Members"],
          value["data"]["Team_B"]["Score"].toString(),
          value["data"]["winner"].toString(),
          value["data"]["new"].toString());
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
          title: Text("Live Badminton"),
        ),
        body: (isloading)?loading_container():Container(
            color: Colors.grey[800],
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: 30.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 20.0,),
                        Text("Team1: ",style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.greenAccent[400],
                        ),),
                        for(int i=0;i<Score.data.teamA.members.length;i++)Container(
                          constraints: BoxConstraints(maxWidth: 170),
                          child: Center(
                            child: Text(
                              Score.data.teamA.members[i],
                              style: TextStyle(
                              fontFamily: "mainfont",
                              fontSize: 15.0,
                              color: Colors.greenAccent[400],
                            ),),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            if(Score.data.result == "no") {
                              setState(() {
                                isloading = true;
                              });
                              upload up = upload();
                              Score.data.teamA.score =
                                  (int.parse(Score.data.teamA.score) + 1)
                                      .toString();
                              await up.updatebadminton(
                                  widget.data1.code, Score);
                              _scaffoldKey.currentState.showSnackBar(snackbar);
                              await Update();
                            }
                            else{
                              _scaffoldKey.currentState.showSnackBar(endgame);
                            }
                          },
                          child: Container(
                            child: Center(child: Icon(Icons.arrow_circle_up_rounded,size: 50.0,color: Colors.blue,)),
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Container(
                          child: Center(
                            child: Text(
                              "Score: " +Score.data.teamA.score,
                              style: TextStyle(
                                fontFamily: "mainfont",
                                fontSize: 30.0,
                                color: Colors.greenAccent[400],
                              ),),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (Score.data.result == "no") {
                              setState(() {
                                isloading = true;
                              });
                              upload up = upload();
                              Score.data.teamA.score =
                                  (int.parse(Score.data.teamA.score) - 1)
                                      .toString();
                              if (int.parse(Score.data.teamA.score) < 0) {
                                Score.data.teamA.score = "0";
                              }
                              await up.updatebadminton(
                                  widget.data1.code, Score);
                              _scaffoldKey.currentState.showSnackBar(snackbar);
                              await Update();
                            }
                            else{
                            _scaffoldKey.currentState.showSnackBar(endgame);
                            }
                          },

                          child: Container(
                            child: Center(child: Icon(Icons.arrow_circle_down_rounded,size: 50.0,color: Colors.red,)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 30.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 20.0,),
                        Text("Team2: ",style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.greenAccent[400],
                        ),),
                        for(int i=0;i<Score.data.teamB.members.length;i++)Container(
                          constraints: BoxConstraints(maxWidth: 170),
                          child: Center(
                            child: Text(
                              Score.data.teamB.members[i],
                              style: TextStyle(
                                fontFamily: "mainfont",
                                fontSize: 20.0,
                                color: Colors.greenAccent[400],
                              ),),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            if(Score.data.result == "no") {
                            setState(() {isloading = true;});
                            upload up = upload();
                            Score.data.teamB.score = (int.parse(Score.data.teamB.score)+1).toString();
                            await up.updatebadminton(widget.data1.code, Score);
                            _scaffoldKey.currentState.showSnackBar(snackbar);
                            await Update();
                            }
                            else{
                            _scaffoldKey.currentState.showSnackBar(endgame);
                            }
                          },
                          child: Container(
                            child: Center(child: Icon(Icons.arrow_circle_up_rounded,size: 50.0,color: Colors.blue,)),
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Container(
                          child: Center(
                            child: Text(
                              "Score: " +Score.data.teamB.score,
                              style: TextStyle(
                                fontFamily: "mainfont",
                                fontSize: 30.0,
                                color: Colors.greenAccent[400],
                              ),),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            if(Score.data.result == "no") {
                            setState(() {isloading = true;});
                            upload up = upload();
                            Score.data.teamB.score = (int.parse(Score.data.teamB.score)-1).toString();
                            if(int.parse(Score.data.teamB.score) < 0){
                              Score.data.teamB.score = "0";
                            }
                            await up.updatebadminton(widget.data1.code, Score);
                            _scaffoldKey.currentState.showSnackBar(snackbar);
                            await Update();
                            }
                            else{
                              _scaffoldKey.currentState.showSnackBar(endgame);
                            }
                          },
                          child: Container(
                            child: Center(child: Icon(Icons.arrow_circle_down_rounded,size: 50.0,color: Colors.red,)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 30.0,),
                GestureDetector(
                  onTap: () async {
                    if(Score.data.result == "no") {
                    setState(() {isloading = true;});
                    upload up = upload();
                    saving sv = new saving();
                    await sv.readfile().then((value) async {
                      await up.endbadminton(value["OrganizerCode"]);
                    });
                    Navigator.of(context).pop(true);
                    Navigator.pushNamed(context, "/updatebadminton");
                    setState(() {isloading = true;});
                    }
                    else{
                      _scaffoldKey.currentState.showSnackBar(endgame);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: borderRadius(20.0),
                      color: Colors.greenAccent[400],
                    ),
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      child: Text("Game Over",style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
