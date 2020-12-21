import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groundlia/Pages/util/Constants.dart';
import 'package:groundlia/Pages/util/widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

int overs = 10;
bool team1 = true;
List<String> TeamA = [], TeamB = [];
String TeamOne = "team1", TeamTwo = "team2";
List<Widget> TeamAlpha = [];
List<Widget> TeamBeta = [];

class PlayCricket extends StatefulWidget {

  @override
  _PlayCricketState createState() => _PlayCricketState();
}

class _PlayCricketState extends State<PlayCricket> {

  @override
  void initState() {
    AddTeam1List();
    AddTeam2List();
    super.initState();
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
              Fluttertoast.showToast(
              msg: "No special characters Allowed",
              backgroundColor: Colors.black,
              textColor: Colors.white);
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
            Fluttertoast.showToast(
                msg: "No special characters Allowed",
                backgroundColor: Colors.black,
                textColor: Colors.white);
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
        body: Container(
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
                                  Fluttertoast.showToast(
                                      msg: "No special characters Allowed",
                                      backgroundColor: Colors.black,
                                      textColor: Colors.white);
                                }else if(TeamA[TeamA.length-1] != '') {
                                  AddTeam1List();
                                }
                                else{
                                  Fluttertoast.showToast(
                                      msg: "Invalid Player Name",
                                      backgroundColor: Colors.black,
                                      textColor: Colors.white);
                                }
                              }
                              else{
                                  if(TeamB[TeamB.length-1].contains(new RegExp(r'[!@#$%^&*()-_+=;/\,.?":{}|<>]'))){
                                    Fluttertoast.showToast(
                                        msg: "No special characters Allowed",
                                        backgroundColor: Colors.black,
                                        textColor: Colors.white);
                                  }else if(TeamB[TeamB.length-1] != '') {
                                    AddTeam2List();
                                  }
                                  else{
                                    Fluttertoast.showToast(
                                        msg: "Invalid Player Name",
                                        backgroundColor: Colors.black,
                                        textColor: Colors.white);
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
                                return (team1)?AlertDialog(
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
                                          team1 = false;
                                          Navigator.of(context).pop();
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
                                ):AlertDialog(
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
                                        setState(() {
                                          Navigator.of(context).pop();
                                          Navigator.of(context).pop(true);
                                          Navigator.pushNamed(context, "/cricketEdit");
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
