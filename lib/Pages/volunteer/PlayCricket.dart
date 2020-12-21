import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groundlia/Pages/player_data/Admin_file.dart';
import 'package:groundlia/Pages/player_data/cricket_players.dart';
import 'package:groundlia/Pages/util/Constants.dart';
import 'package:groundlia/Pages/util/widget.dart';

int overs = 10;
bool team1 = true;
bool showscreen = false;
List<String> TeamA = [], TeamB = [];
String TeamOne = "team1", TeamTwo = "team2";
List<Widget> TeamAlpha = [];
List<Widget> TeamBeta = [];
cricket_player cricket_team1 = new cricket_player();
cricket_player cricket_team2 = new cricket_player();

class PlayCricket extends StatefulWidget {
  admin_file cricket_file;
  PlayCricket(this.cricket_file);


  @override
  _PlayCricketState createState() => _PlayCricketState();
}

class _PlayCricketState extends State<PlayCricket> {

  @override
  void initState() {
    AddTeam1List();
    AddTeam2List();
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => dialog(context));
  }


  void AddTeam1List() {
      TeamA.add('');
      TeamAlpha.add(Padding(
        padding: const EdgeInsets.all(18.0),
        child: TextField(
          style: TextStyle(
              color: Colors.white
          ),

          decoration: InputDecoration(
              hintText: "Member Name",
              hintStyle: TextStyle(
                  color: Colors.grey,
              )

          ),
          onChanged: (val){
            TeamA[TeamA.length-1]=val;
            if(TeamA[TeamA.length-1].contains(new RegExp(r'[!@#$%^&*()-_+=;/\,.?":{}|<>]'))){
             toast("No Special Characters allowed");
              }
          },
        ),
      ),
      );

  }

  void AddTeam2List() {
    TeamB.add('');
    TeamBeta.add(Padding(
      padding: const EdgeInsets.all(18.0),
      child: TextField(
        controller: TextEditingController(text: ""),
        style: TextStyle(
            color: Colors.white
        ),
        decoration: InputDecoration(
            hintText: "Member Name",
            hintStyle: TextStyle(
              color: Colors.grey,
            )
        ),
        onChanged: (val){
          TeamB[TeamB.length-1]=val;
          if(TeamB[TeamB.length-1].contains(new RegExp(r'[!@#$%^&*()-_+=;/\,.?":{}|<>]'))){
            toast("No Special Characters allowed");
          }
        },
      ),
    ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: (showscreen)?Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.grey[900],
              child: Column(
                children: [
                  Heading("Final view", context),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 210,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          finalCard(cricket_team1,context),
                          finalCard(cricket_team2,context),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        showscreen = false;
                      });
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "/cricketedit");
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 20.0),
                      decoration: BoxDecoration(
                        borderRadius: borderRadius(15),
                        color: Colors.greenAccent[400],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.done,size: 35,),
                          Text("done",style: TextStyle(fontSize: 30.0),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
        )
            :Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.grey[900],
          child: ListView(
            children: <Widget>[
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Heading("Cricket Match",context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Number of Overs: ',
                          style: kHeadingTextStyle.copyWith(
                            fontSize: 25,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              overs++;
                            });
                          },
                          child: Icon(
                            Icons.arrow_drop_up,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          ' $overs',
                          textAlign: TextAlign.left,
                          style: kHeadingTextStyle.copyWith(
                            fontSize: 30,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              overs--;
                            });
                          },
                          child: Icon(
                            Icons.arrow_drop_down,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30.0,bottom: 10.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: borderRadius(20)),
                      width: MediaQuery.of(context).size.width - 100,
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                          children: (!team1)?[
                            ClipRRect(
                                borderRadius: borderRadius(100),
                                child: Icon(
                                  Icons.group_sharp,
                                  size: 30,
                                )),
                            Container(
                              width: MediaQuery.of(context).size.width - 200,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "TEAM 2 NAME",
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                onChanged: (val) {
                                  setState(() {
                                    TeamTwo = val;
                                  });
                                },
                              ),
                            ),
                          ]:[
                          ClipRRect(
                              borderRadius: borderRadius(100),
                              child: Icon(
                                Icons.group_sharp,
                                size: 30,
                              )),
                          Container(
                            width: MediaQuery.of(context).size.width - 200,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "TEAM 1 NAME",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              onChanged: (val) {
                                setState(() {
                                  TeamOne = val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Members:",
                      style: kHeadingTextStyle,
                    ),

                      Column(
                        children: (team1)?TeamAlpha:TeamBeta,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                if(team1){
                                if(TeamA[TeamA.length-1].contains(new RegExp(r'[!@#$%^&*()-_+=;/\,.?":{}|<>]'))){
                                  toast("No Special characters allowed");
                                }else if(TeamA[TeamA.length-1] != '') {
                                  AddTeam1List();
                                }
                                else{
                                  toast("Invalid Player Name");
                                }
                              }
                              else{
                                  if(TeamB[TeamB.length-1].contains(new RegExp(r'[!@#$%^&*()-_+=;/\,.?":{}|<>]'))){
                                    toast("No special characters allowed");
                                  }else if(TeamB[TeamB.length-1] != '') {
                                    AddTeam2List();
                                  }
                                  else{
                                    toast("Invalid Player Name");
                                  }
                                }
                              });
                              for(int i=0;i<TeamA.length;i++){
                                print(TeamA[i]);
                              }
                              for(int i=0;i<TeamB.length;i++){
                                print(TeamB[i]);
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 10.0),
                              padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                color: Colors.greenAccent[400],
                                borderRadius: BorderRadius.all(Radius.circular(15.0))
                              ),
                              child: Icon(
                                  Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                            showDialog<void>(
                              context: context,
                              barrierDismissible: false, // user must tap button!
                              builder: (BuildContext context) {
                                return (!team1)?AlertDialog(
                                  title: Text('Saving Team 2: ' + TeamTwo),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Text('On Approve You cant change'),
                                        Text('Team 2 Members list'),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    InkWell(
                                      child: Text('Approve'),
                                      onTap: () {
                                        if(TeamB.length <= 1 || TeamB[TeamB.length - 1] == ''){
                                          toast("Somethings not right");
                                        }
                                        else {
                                          setState(() {
                                            showscreen = true;
                                          });
                                          Navigator.of(context).pop();
                                          cricket_team2.getting_players(
                                              overs, TeamTwo, TeamB);
                                          widget.cricket_file
                                              .saving_cricket_players(
                                              cricket_team1);
                                          widget.cricket_file
                                              .saving_cricket_players(
                                              cricket_team2);
                                          team1 = true;
                                          TeamA.clear();
                                          TeamB.clear();
                                          TeamOne = "";
                                          TeamTwo = "";
                                          TeamAlpha.clear();
                                          TeamBeta.clear();
                                          AddTeam1List();
                                          AddTeam2List();
                                        }
                                      },
                                    ),
                                    TextButton(
                                      child: Text('Deny'),
                                      onPressed: () {
                                        setState(() {
                                          Navigator.of(context).pop();
                                        });
                                      },
                                    ),
                                  ],
                                ) :AlertDialog(
                                  title: Text('Saving Team 1: ' + TeamOne),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Text('On Approve You cant change'),
                                        Text('Team 1 Members list'),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: Text('Approve'),
                                      onPressed: () {
                                        setState(() {
                                          if(TeamA.length <= 1 || TeamA[TeamA.length - 1] == ''){
                                            toast("Somethings not right");
                                          }
                                          else {
                                            team1 = false;
                                            cricket_team1.getting_players(
                                                overs, TeamOne, TeamA);
                                            Navigator.of(context).pop();
                                          }
                                        });
                                      },
                                    ),
                                    TextButton(
                                      child: Text('Deny'),
                                      onPressed: () {
                                        setState(() {
                                          Navigator.of(context).pop();
                                        });
                                      },
                                    ),
                                  ],
                                );
                              });
                            },
                            child: Container(
                                margin: EdgeInsets.only(top: 10.0),
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  borderRadius: borderRadius(15),
                                  color: Colors.greenAccent[400],
                                ),
                                child: Icon(Icons.done,color: Colors.white,)),
                          )
                        ],
                      ),
                    ]),
              ],
            ),
          ),
        ),
      );
  }
}
