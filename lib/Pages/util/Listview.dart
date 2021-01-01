import 'package:flutter/material.dart';
import 'package:groundlia/Pages/Scores/badminton_score.dart';
import 'package:groundlia/Pages/Scores/cricket_score.dart';

Widget CricketEachGameScore(CricketScore ScoreCard, double width){
  return Container(
    margin: EdgeInsets.only(top: 10.0,left: 5.0, right: 5.0,bottom: 10.0),
      width: width - 10.0,
      decoration: BoxDecoration(
        color: Colors.greenAccent[400],
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Column(
        children: [
          SizedBox(height: 15.0,),
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
            "Team 1 Score: " + ScoreCard.data.teamA.runs + "/" + ScoreCard.data.teamA.wicket,
            style: TextStyle(
                fontSize: 23.0,
                fontFamily: "mainfont"
            ),
          ),

          Text(
            "Team 2 Score: " + ScoreCard.data.teamB.runs + "/" + ScoreCard.data.teamB.wicket,
            style: TextStyle(
                fontSize: 23.0,
                fontFamily: "mainfont"
            ),
          ),

          Text(
            "Overs: " + ScoreCard.data.overs,
            style: TextStyle(
                fontSize: 23.0,
                fontFamily: "mainfont"
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 5.0),
            child: Text(
              "Team 1: " + ScoreCard.data.teamA.mode,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          Container(
            width: width - 15,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for(int i=0;i<ScoreCard.data.teamA.members.length;i++)Container(
                    margin: EdgeInsets.only(left: 20.0),
                    child: Text(
                      ScoreCard.data.teamA.members[i] + ", ",
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 25.0,
                          fontFamily: "mainfont"
                      ),
                    ),
                  ),
                ],
              )
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 5.0),
            child: Text(
              "Team 2: " + ScoreCard.data.teamB.mode,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          Container(
            width: width - 15,
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for(int i=0;i<ScoreCard.data.teamA.members.length;i++)(Container(
                      margin: EdgeInsets.only(left: 20.0),
                      child: Text(
                        ScoreCard.data.teamB.members[i] + ",",
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 25.0,
                            fontFamily: "mainfont"
                        ),
                      ),
                    ))
                  ],
                )
            ),
          ),
          SizedBox(height: 15.0,),
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
          SizedBox(height: 15.0,),
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
          SizedBox(height: 15.0,),
          Container(
            width: width - 15,
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for(int i=0;i<ScoreCard.data.teamA.members.length;i++)(Container(
                      margin: EdgeInsets.only(left: 20.0),
                      child: Text(
                        ScoreCard.data.teamA.members[i] + ",",
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 25.0,
                        ),
                      ),
                    ))
                  ],
                )
            ),
          ),
          SizedBox(height: 15.0,),
          Container(
            child: Text(
              "Team 2",
              style: TextStyle(
                  fontSize: 25.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 15.0,),
          Container(
            width: width - 15,
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for(int i=0;i<ScoreCard.data.teamA.members.length;i++)(Container(
                      margin: EdgeInsets.only(left: 20.0),
                      child: Text(
                        ScoreCard.data.teamB.members[i] + ",",
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 25.0,
                        ),
                      ),
                    ))
                  ],
                )
            ),
          ),
          SizedBox(height: 15.0,),
        ],
      )
  );
}

Widget BadmintonEachGameScore(var ScoreCard, double width){
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