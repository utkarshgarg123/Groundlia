import 'package:flutter/material.dart';
import 'package:groundlia/Pages/Api/storing_locally.dart';
import 'package:groundlia/Pages/Api/upload.dart';
import 'package:groundlia/Pages/util/Constants.dart';
import 'package:groundlia/Pages/util/Data.dart';

class BadmintonNewGame extends StatefulWidget {
  LData data1;
  SData data2;
  BadmintonNewGame(this.data1, this.data2);

  @override
  _BadmintonNewGameState createState() => _BadmintonNewGameState();
}

class _BadmintonNewGameState extends State<BadmintonNewGame> {
  int players = 1;
  String team11 = "";
  String team12 = "";
  String team21 = "";
  String team22 = "";

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
          title: Text("New Badminton Game"),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          color: Colors.grey[800],
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text("No. of Players: ",style: TextStyle(
                      fontFamily: "mainfont",
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent[400],
                    ),),

                    GestureDetector(
                      onTap: (){
                        setState(() {
                          players = 1;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 5.0,bottom: 5.0,left: 10.0,right: 10.0),
                        margin: EdgeInsets.only(left: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: borderRadius(10.0),
                          color: (players == 1)?Colors.greenAccent[400]:Colors.red,
                        ),
                        child: Center(child: Text("1",style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),)),
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        setState(() {
                          players = 2;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0),
                        padding: EdgeInsets.only(top: 5.0,bottom: 5.0,left: 10.0,right: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: borderRadius(10.0),
                          color: (players == 2)?Colors.greenAccent[400]:Colors.red,
                        ),
                        child: Center(child: Text("2",style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.0,),
                Text("Team1: ",style: TextStyle(
                  fontFamily: "mainfont",
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.greenAccent[400],
                ),),

                for(int i=0;i<players;i++)Container(
                    width: MediaQuery.of(context).size.width/2+50,
                    child: TextField(
                      onChanged: (val){
                      if(i==0){team11 = val;}
                      else{team12 = val;}
                      },
                      style: TextStyle(
                          color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        hintText: "Members Name",
                      ),
                    )),
                SizedBox(height: 30.0,),
                Text("Team2: ",style: TextStyle(
                  fontFamily: "mainfont",
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.greenAccent[400],
                ),),

                for(int i=players-1;i>=0;i--)Container(
                  width: MediaQuery.of(context).size.width/2+50,
                  child: TextField(
                    onChanged: (val){
                      if(i==0){team21 = val;}
                      else{team22 = val;}
                    },
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: "Members Name",
                    ),
                  )),

                SizedBox(height: 30.0,),
                GestureDetector(
                  onTap: () async{
                    List<String> team1 = new List();
                    List<String> team2 = new List();
                    team1.add(team11);
                    team2.add(team21);
                    if(players == 2){
                      team1.add(team12);
                      team2.add(team22);
                    }
                    upload up = new upload();
                    saving sv = new saving();
                    await sv.readfile().then((value) async {
                      await up.createbadminton(value["OrganizerCode"],players, team1, team2);
                    });
                    Navigator.of(context).pop(true);
                    Navigator.pushNamed(context, "/updatebadminton");
                    print("team1: " + team1.toString());
                    print("team2: " + team2.toString());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: borderRadius(25.0),
                      color: Colors.greenAccent[400],),
                    padding: EdgeInsets.all(10.0),
                    child: Text("done",style: TextStyle(fontSize: 35.0,fontWeight: FontWeight.bold,fontFamily: "mainfont"),),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
