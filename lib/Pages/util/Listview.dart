import 'package:flutter/material.dart';
import 'package:groundlia/Pages/Scores/badminton_score.dart';

Widget CricketEachGameScore(Map<dynamic,dynamic> ScoreCard, double width){
  return Container(
    margin: EdgeInsets.only(top: 10.0,left: 5.0, right: 5.0,bottom: 10.0),
      width: width - 10.0,
      decoration: BoxDecoration(
        color: Colors.greenAccent[400],
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 5.0),
            color: Colors.red,
            child: Text(
              ScoreCard["Team1"]["Captain"].toString() + " VS " + ScoreCard["Team2"]["Captain"].toString(),
              style: TextStyle(
                fontSize: 25.0,
                fontFamily: "mainfont"
              ),
            ),
          ),
          Text(
            "Toss win by: " + ScoreCard["WhoWinToss"].toString(),
            style: TextStyle(
                fontSize: 25.0,
                fontFamily: "mainfont"
            ),
          ),
          Text(
            "Winner is: " + ScoreCard["Winner"].toString(),
            style: TextStyle(
                fontSize: 25.0,
                fontFamily: "mainfont"
            ),
          ),
          Container(
            color: Colors.red,
            child: Text(
              "Team 1: " + ScoreCard["Team1"]["Captain"].toString(),
              style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: "mainfont"
              ),
            ),
          ),
          Text(
            "Team 1 mode: " + ScoreCard["Team1"]["Mode"].toString(),
            style: TextStyle(
                fontSize: 25.0,
                fontFamily: "mainfont"
            ),
          ),
          Text(
            "Team 1 Score: " + ScoreCard["Team1"]["Score"].toString() + "/" + ScoreCard["Team1"]["Wickets"].toString(),
            style: TextStyle(
                fontSize: 25.0,
                fontFamily: "mainfont"
            ),
          ),
          Text(
            "Team 1 Current Over: " + ScoreCard["Team1"]["Current Over"].toString(),
            style: TextStyle(
                fontSize: 25.0,
                fontFamily: "mainfont"
            ),
          ),


          Container(
            color: Colors.red,
            child: Text(
              "Team 2: " + ScoreCard["Team2"]["Captain"].toString(),
              style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: "mainfont"
              ),
            ),
          ),
          Text(
            "Team 2 mode: " + ScoreCard["Team2"]["Mode"].toString(),
            style: TextStyle(
                fontSize: 25.0,
                fontFamily: "mainfont"
            ),
          ),
          Text(
            "Team 2 Score: " + ScoreCard["Team2"]["Score"].toString() + "/" + ScoreCard["Team1"]["Wickets"].toString(),
            style: TextStyle(
                fontSize: 25.0,
                fontFamily: "mainfont"
            ),
          ),
          Text(
            "Team 2 Current Over: " + ScoreCard["Team2"]["Current Over"].toString(),
            style: TextStyle(
                fontSize: 25.0,
                fontFamily: "mainfont"
            ),
          ),
          Container(
            color: Colors.red,
            child: Text(
              "Team Players Name:",
              style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: "mainfont"
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5.0,top: 5.0),
                color: Colors.yellow,
                child: Text(
                  ScoreCard["Team1"]["Captain"].toString(),
                  style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: "mainfont"
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5.0,top: 5.0),
                color: Colors.pink,
                child: Text(
                  ScoreCard["Team2"]["Captain"].toString(),
                  style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: "mainfont"
                  ),
                ),
              ),
            ],
          ),
          for(int i=1;i<11;i++) Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5.0),
                color: Colors.yellow,
                child: Text(
                  ScoreCard["Team1"]["Members"]["Player"+ i.toString()].toString(),
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: "mainfont"
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5.0),
                color: Colors.pinkAccent,
                child: Text(
                  ScoreCard["Team2"]["Members"]["Player" + i.toString()].toString(),
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: "mainfont"
                  ),
                ),
              ),

            ],
          )
        ],
      )
  );
}

Widget BasketballEachGameScore(var ScoreCard, double width){
  return Container(
      margin: EdgeInsets.only(top: 10.0,left: 5.0, right: 5.0,bottom: 10.0),
      width: width - 10.0,
      decoration: BoxDecoration(
        color: Colors.greenAccent[400],
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Column(
        children: [
          (ScoreCard.data.result  == "no")?Text(
        "Game in Progress",
        style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.w500,
        ),)
      :Text(
            "Winner is: " + ScoreCard.data.result,
            style: TextStyle(
                fontSize: 25.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "Team 1 Score: " + ScoreCard.data.teamA.score,
            style: TextStyle(
                fontSize: 25.0,
                fontFamily: "mainfont"
            ),
          ),

          Text(
            "Team 2 Score: " + ScoreCard.data.teamB.score,
            style: TextStyle(
                fontSize: 25.0,
                fontFamily: "mainfont"
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.0),
            child: Text(
              "Team 1",
              style: TextStyle(
                  fontSize: 25.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          for(int i=0;i<ScoreCard.data.teamA.members.length;i++) Container(
            margin: EdgeInsets.only(bottom: 5.0),
            child: Text(
              ScoreCard.data.teamA.members[i],
              maxLines: 1,
              style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: "mainfont"
              ),
            ),
          ),
          Container(
            child: Text(
              "Team 2",
              style: TextStyle(
                  fontSize: 25.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          for(int i=0;i<ScoreCard.data.teamB.members.length;i++) Container(
            margin: EdgeInsets.only(bottom: 5.0),
            child: Text(
              ScoreCard.data.teamB.members[i],
              maxLines: 1,
              style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: "mainfont"
              ),
            ),
          ),
        ],
      )
  );
}