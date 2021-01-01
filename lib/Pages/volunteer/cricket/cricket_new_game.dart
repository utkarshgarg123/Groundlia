import 'package:flutter/material.dart';
import 'package:groundlia/Pages/Api/storing_locally.dart';
import 'package:groundlia/Pages/Api/upload.dart';
import 'package:groundlia/Pages/util/Constants.dart';
import 'package:groundlia/Pages/util/Data.dart';

class CricketNewGame extends StatefulWidget {
  LData data1;
  SData data2;
  CricketNewGame(this.data1, this.data2);

  @override
  _CricketNewGameState createState() => _CricketNewGameState();
}

class _CricketNewGameState extends State<CricketNewGame> {
  int players = 1;
  List<String> Team1 = [""];
  List<String> Team2 = [""];
  String mode1 = "batting",mode2 = "bolling";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent[400],
          title: Text("New Cricket Game"),
        ),
        body: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height,
          color: Colors.grey[800],
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text("No. of Players: ", style: TextStyle(
                      fontFamily: "mainfont",
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent[400],
                    ),),

                    Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              players++;
                              Team1.add("");
                              Team2.add("");
                              if(players > 13){players = 13;
                              Team1.removeLast();
                              Team2.removeLast();
                              }
                            });
                          },
                          child: Container(
                            child: Icon(Icons.arrow_circle_up_rounded,size: 50.0,color: Colors.blue,),
                          ),
                        ),
                        Text(players.toString(), style: TextStyle(
                          fontFamily: "mainfont",
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.greenAccent[400],
                        ),),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              players--;
                              Team1.removeLast();
                              Team2.removeLast();
                              if(players < 1){players = 1;
                              Team1.add("");
                              Team2.add("");}
                            });
                          },
                          child: Container(
                            child: Icon(Icons.arrow_circle_down_rounded,size: 50.0,color: Colors.red,),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30.0,),
                Text("Team1: ", style: TextStyle(
                  fontFamily: "mainfont",
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.greenAccent[400],
                ),),

                for(int i = 0; i < players; i++)Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 2 + 50,
                    child: TextField(
                      onChanged: (val) {
                        Team1[i] = val;
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        hintText: "Members Name",
                      ),
                    )),
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Mode: ", style: TextStyle(
                      fontFamily: "mainfont",
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent[400],
                    ),),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          mode1 = "batting";
                          mode2 = "bolling";
                        });
                      },
                      child: Container(
                        child: Icon(Icons.sports_cricket,size: 50.0,color: (mode1 == "batting")?Colors.greenAccent[400]:Colors.red,),
                      ),
                    ),
                    SizedBox(width: 5.0,),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          mode1 = "bolling";
                          mode2 = "batting";
                        });
                      },
                      child: Container(
                        child: Icon(Icons.sports_baseball_sharp,size: 50.0,color: (mode1 == "bolling")?Colors.greenAccent[400]:Colors.red,),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.0,),
                Text("Team2: ", style: TextStyle(
                  fontFamily: "mainfont",
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.greenAccent[400],
                ),),

                for(int i = players - 1; i >= 0; i--)Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 2 + 50,
                    child: TextField(
                      onChanged: (val) {
                        Team2[i] = val;
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        hintText: "Members Name",
                      ),
                    )),

                SizedBox(height: 30.0,),
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Mode: ", style: TextStyle(
                      fontFamily: "mainfont",
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent[400],
                    ),),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          mode2 = "batting";
                          mode1 = "bolling";
                        });
                      },
                      child: Container(
                        child: Icon(Icons.sports_cricket,size: 50.0,color: (mode2 == "batting")?Colors.greenAccent[400]:Colors.red,),
                      ),
                    ),
                    SizedBox(width: 5.0,),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          mode2 = "bolling";
                          mode1 = "batting";
                        });
                      },
                      child: Container(
                        child: Icon(Icons.sports_baseball_sharp,size: 50.0,color: (mode2 == "bolling")?Colors.greenAccent[400]:Colors.red,),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                GestureDetector(
                  onTap: () async {
                    upload up = new upload();
                    print(mode1 + mode2);
                    saving sv = new saving();
                    await sv.readfile().then((value) async {
                      await up.createcricket(value["OrganizerCode"], Team1, Team2, mode1, mode2);
                    });
                    Navigator.of(context).pop(true);
                    Navigator.pushNamed(context, "/updatecricket");
                    print("team1: " + Team1.toString());
                    print("team2: " + Team2.toString());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: borderRadius(25.0),
                      color: Colors.greenAccent[400],),
                    padding: EdgeInsets.all(10.0),
                    child: Text("done",
                      style: TextStyle(fontSize: 35.0, fontWeight: FontWeight
                          .bold, fontFamily: "mainfont"),),
                  ),
                ),
                SizedBox(height: 10.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
