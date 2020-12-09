import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groundlia/Pages/util/Constants.dart';
import 'package:groundlia/Pages/util/widget.dart';

int overs = 10;
bool temp=false;
List<String> TeamA = [], TeamB = [];
String TeamOne, TeamTwo;
List<Widget> TeamAlpha = [];

class PlayCricket extends StatefulWidget {

  @override
  _PlayCricketState createState() => _PlayCricketState();
}

class _PlayCricketState extends State<PlayCricket> {


  void AddTeam1List() {
      temp=false;
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
            if(!temp) TeamA.add('');
            temp=true;
            TeamA[TeamA.length-1]=val;
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
                          borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                      width: MediaQuery.of(context).size.width - 100,
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100.0)),
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
                          )
                        ],
                      ),
                    ),
                    Text(
                      "Members:",
                      style: kHeadingTextStyle,
                    ),

                      Column(
                        children: TeamAlpha,
                      ),
                      GestureDetector(
                        onTap: (){

                          setState(() {
                            AddTeam1List();

                          });
                          for(int i=0;i<TeamA.length;i++){
                            print(TeamA[i]);
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
                    ]),
              ],
            ),
          ),
        ),
      );
  }
}
