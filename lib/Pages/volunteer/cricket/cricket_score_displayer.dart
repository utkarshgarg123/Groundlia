import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groundlia/Pages/Api/download.dart';
import 'package:groundlia/Pages/Api/storing_locally.dart';
import 'package:groundlia/Pages/Api/upload.dart';
import 'package:groundlia/Pages/Extra/loading_container.dart';
import 'package:groundlia/Pages/Scores/cricket_score.dart';
import 'package:groundlia/Pages/util/Constants.dart';
import 'package:groundlia/Pages/util/Data.dart';
import 'package:flushbar/flushbar.dart';

class ShowScore extends StatefulWidget {
  CricketScore score;
  int i;
  double width;
  final VoidCallback onCallBack;

  final Function(int) setTheState;

  BuildContext cnxt;
  ShowScore({@required this.score,@required this.i,@required this.width,@required this.cnxt, @required this.setTheState, @required this.onCallBack});

  @override
  _ShowScoreState createState() => _ShowScoreState();
}

class _ShowScoreState extends State<ShowScore> {

  var team;
  var rivalteam;
  bool isediting = false;
  bool iswide = false;
  int send_score = 0;
  String Stringteam;
  Timer time;
  int wickets;
  double overs;
  bool ismanuallychange = false;
  bool isloading = false;
  final snackbar = SnackBar(
    content: Text("Updating . . ."),
    duration: Duration(seconds: 2),
  );

  @override
  void initState() {
    isediting = false;
    if(widget.i == 0){team = widget.score.data.teamA;Stringteam = "Team1: ";rivalteam = widget.score.data.teamB;}
    else{team = widget.score.data.teamB;Stringteam = "Team2: ";rivalteam = widget.score.data.teamA;}
    time = new Timer.periodic(Duration(seconds: 1), (Timer t) => Update());
    super.initState();
  }

  @override
  void dispose() {
    time.cancel();
    super.dispose();
  }

  Future<void> Update() async{
    download dn = download();
    saving sv = new saving();
    await sv.readfile().then((value) async {
      LData data = new LData();
      data.code = value["OrganizerCode"];
    await dn.CricketScore(data).then((value) {
      widget.score.dataelements(value["data"]["Team_A"]["Members"],
          value["data"]["Team_A"]["Runs"].toString(),
          value["data"]["Team_B"]["Members"],
          value["data"]["Team_B"]["Runs"].toString(),
          value["data"]["winner"].toString(),
          value["data"]["new"].toString(),
          value["data"]["Team_A"]["Wickets"].toString(),
          value["data"]["Team_B"]["Wickets"].toString(),
          value["data"]["Team_A"]["Mode"],
          value["data"]["Team_B"]["Mode"],
          value["data"]["overs"]);
    });}).then((value) => setState((){isloading = false;}));
  }

  void showDefaultSnackbar(BuildContext context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Updating...'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void showfinalSnackbar(BuildContext context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('No permission to change innings'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void gameends(BuildContext context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Game Ends Cant change the score'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  GestureDetector runs(int runs, var color, var t){
    return GestureDetector(
      onTap: ()async {
        if(widget.score.data.result == "no") {
          setState(() {
            isloading = true;
          });
          t.runs = (int.parse(t.runs) + runs).toString();
          print("runs: " + t.runs);
          var o = double.tryParse(widget.score.data.overs);
          o += 0.1;
          if (((o % 1) * 10).round() == 6) {
            o -= 0.6;
            o += 1;
          }
          print("overs: " + o.toStringAsFixed(1));
          widget.score.data.overs = o.toStringAsFixed(1);
          upload up = new upload();
          saving sv = new saving();
          await sv.readfile().then((value) {
            up.updatecricket(value["OrganizerCode"], widget.score);
          }).then((value) => showDefaultSnackbar(context));
          setState(() {
            Update();
          });
        }else{
          gameends(context);
        }
      },
      child: Container(
        margin: EdgeInsets.all(5.0),
        padding: EdgeInsets.only(top: 1.5,bottom: 1.5,left: 10.0,right: 10.0),
        decoration: BoxDecoration(
          borderRadius: borderRadius(10.0),
          color: color,
        ),
        child: Text(
          runs.toString(),
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  GestureDetector Specialruns(String text, var color, var team){
    return GestureDetector(
      onTap: ()async {
        if(widget.score.data.result == "no") {
          if (text == "Wicket") {
            setState(() {
              isloading = true;
            });
            var o = double.tryParse(widget.score.data.overs);
            o += 0.1;
            if (((o % 1) * 10).round() == 6) {
              o -= 0.6;
              o += 1;
            }
            print("overs: " + o.toStringAsFixed(1));
            widget.score.data.overs = o.toStringAsFixed(1);
            team.wicket = (int.parse(team.wicket) + 1).toString();
            upload up = new upload();
            saving sv = new saving();
            await sv.readfile().then((value) {
              up.updatecricket(value["OrganizerCode"], widget.score);
            }).then((value) => showDefaultSnackbar(context));
            setState(() {
              Update();
            });
          }
          else if (text == "Game Over") {
            upload up = new upload();
            saving sv = new saving();
            await sv.readfile().then((value) {
              up.endcricket(value["OrganizerCode"]);
              Navigator.of(context).pop(true);
              Navigator.pushNamed(context, "/updatecricket");
            });
          }
          else if (text == "Wide") {
            setState(() {
              send_score = 0;
              isediting = !isediting;
              iswide = true;
            });
          } else if (text == "No Ball") {
            setState(() {
              send_score = 0;
              isediting = !isediting;
              iswide = false;
            });
          } else if (text == "Change Position") {
            print("here");
            print(rivalteam.runs);
            if (rivalteam.runs == "0") {
              setState(() {
                isloading = true;
              });
              team.mode = "bolling";
              rivalteam.mode = "batting";
              widget.score.data.overs = "0.0";
              upload up = new upload();
              saving sv = new saving();
              await sv.readfile().then((value) {
                up.updatecricket(value["OrganizerCode"], widget.score);
              }).then((value) => showDefaultSnackbar(context));
              setState(() {
                Update();
              });
              widget.setTheState(1);
              widget.onCallBack();
              Navigator.of(context).pop(true);
              Navigator.pushNamed(context, "/updatecricket");
            } else {
              showfinalSnackbar(context);
            }
          } else if (text == "Change Score Manually") {
            setState(() {
              ismanuallychange = !ismanuallychange;
            });
          }
        }else{
          gameends(context);
        }
      },

      child: Container(
        margin: EdgeInsets.all(5.0),
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: borderRadius(10.0),
          color: color,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (isloading)?Container(
        height: MediaQuery.of(widget.cnxt).size.height,
        child: loading_container()):Column(
      children: [
            SizedBox(height: 20.0,),
            Text(Stringteam + team.mode,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.greenAccent[400],
              ),),

            Container(
              margin: EdgeInsets.only(top: 10.0),
              width: widget.width - 15,
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for(int i=0;i<team.members.length;i++)Container(
                        margin: EdgeInsets.only(left: 20.0),
                        child: Text(
                          team.members[i] + ", ",
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: "mainfont",
                            fontWeight: FontWeight.bold,
                            color: Colors.greenAccent[400],
                          ),
                        ),
                      ),
                    ],
                  )
              ),
            ),
            SizedBox(height: 20.0,),
            Container(
              child: Center(
                child: Text(
                  "Score: " + team.runs + "/" + team.wicket,
                  style: TextStyle(
                    fontFamily: "mainfont",
                    fontSize: 30.0,
                    color: Colors.greenAccent[400],
                  ),),
              ),
            ),
            SizedBox(height: 20.0,),
            Container(
              child: Center(
                child: Text(
                  "Overs: " + widget.score.data.overs,
                  style: TextStyle(
                    fontFamily: "mainfont",
                    fontSize: 30.0,
                    color: Colors.greenAccent[400],
                  ),),
              ),
            ),
            SizedBox(height: 25.0,),
            Container(
              width: MediaQuery.of(context).size.width - 20,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    runs(0, Colors.red,team),
                    runs(1, Colors.greenAccent[400],team),
                    runs(2, Colors.greenAccent[400],team),
                    runs(3, Colors.red,team),
                    runs(4, Colors.greenAccent[400],team),
                    runs(5, Colors.red,team),
                    runs(6, Colors.greenAccent[400],team),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Specialruns("Wide", Colors.greenAccent[400],team),
                Specialruns("Wicket", Colors.red,team),
                Specialruns("No Ball", Colors.greenAccent[400],team),
              ],
            ),
        (isediting)?Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width/2-25,
              child: TextFormField(
                onChanged: (val){
                  send_score = int.parse(val);
                },
                style: TextStyle(
                  fontSize: 25.0,
                ),
                decoration: InputDecoration(
                  hintText: (iswide)?"Wide ball score":"No Ball score",
                  hintStyle: TextStyle(
                    fontSize: 20.0,
                  )
                ),
                maxLength: 1,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
              ),
            ),
            GestureDetector(
              onTap: ()async{
                setState(() {
                  isloading = true;
                });
                team.runs = (int.parse(team.runs) + send_score).toString();
                print("runs: " + team.runs);
                upload up = new upload();
                saving sv = new saving();
                await sv.readfile().then((value) {
                  up.updatecricket(value["OrganizerCode"], widget.score);
                }).then((value) => showDefaultSnackbar(context));
                setState(() {
                  isediting = false;
                  Update();
                });
              },
              child: Container(
                margin: EdgeInsets.only(left: 20.0),
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: borderRadius(10.0),
                  color: Colors.greenAccent[400],
                ),
                child: Icon(Icons.send),
              ),
            ),
          ],
        ):Container(),
        SizedBox(height: 20.0,),
        Specialruns("Change Position", Colors.greenAccent[400],team),
        Specialruns("Change Score Manually", Colors.greenAccent[400],team),
        (ismanuallychange)?Container(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width/3-10,
                child: TextFormField(
                  onChanged: (val){
                    send_score = int.parse(val);
                  },
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                  decoration: InputDecoration(
                      hintText: "Score",
                      hintStyle: TextStyle(
                        fontSize: 20.0,
                      )
                  ),
                  maxLength: 4,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width/3-10,
                child: TextFormField(
                  onChanged: (val){
                    wickets = int.parse(val);
                  },
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                  decoration: InputDecoration(
                      hintText: "Wickets",
                      hintStyle: TextStyle(
                        fontSize: 20.0,
                      )
                  ),
                  maxLength: 2,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width/3-10,
                child: TextFormField(
                  onChanged: (val){
                    overs = double.parse(val);
                  },
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                  decoration: InputDecoration(
                      hintText: "Overs",
                      hintStyle: TextStyle(
                        fontSize: 20.0,
                      )
                  ),
                  maxLength: 3,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter(RegExp(r'(^\d*\.?\d*)')),
                  ],
                ),
              ),
              GestureDetector(
                onTap: ()async{
                  setState(() {
                    isloading = true;
                    ismanuallychange = false;
                  });
                  widget.score.data.overs = overs.toString();
                  team.wicket = wickets.toString();
                  team.runs = send_score.toString();
                  print("runs: " + team.runs);
                  print("wickets: " + wickets.toString());
                  print("overs: " + overs.toString());
                  upload up = new upload();
                  saving sv = new saving();
                  await sv.readfile().then((value) {
                    up.updatecricket(value["OrganizerCode"], widget.score);
                  }).then((value) => showDefaultSnackbar(context));
                  setState(() {
                    isediting = false;
                    Update();
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(left: 20.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: borderRadius(10.0),
                    color: Colors.greenAccent[400],
                  ),
                  child: Icon(Icons.send),
                ),
              ),
            ],
          ),
        ):Container(),
        SizedBox(height: 20.0,),
        Specialruns("Game Over", Colors.red,team),
        SizedBox(height: 20.0,),
      ],
    );
  }
}