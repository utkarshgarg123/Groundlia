import 'package:flutter/material.dart';
import 'package:groundlia/Pages/util/Constants.dart';
import 'PlayCricket.dart';


class CricketScoreBoard extends StatefulWidget {
  @override
  _CricketScoreBoardState createState() => _CricketScoreBoardState();
}

class _CricketScoreBoardState extends State<CricketScoreBoard> {
  int score = 0, wicket = 0;
  double CurrentOver=0;
  int Bowl=0;
  //Button for score
  FloatingActionButton ScoreButton(String show,int act){
    return FloatingActionButton(
      onPressed: () {

        setState(() {
          if(act>=0) score+=act;
          else if(act==-1) wicket+=1;
          else {score=0;wicket=0;CurrentOver=0;Bowl=0;}
          if(Bowl==6) {CurrentOver+=0.5; Bowl=0;}
          else if(act!=-2)CurrentOver+=0.1;
        });
        Bowl++;
        if(Bowl>6) Bowl=0;

      },
      child: Text(show,
        style: kHeadingTextStyle,),
      backgroundColor: Colors.black,

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
                    Image(
                      image: AssetImage("Assets/Images/appicon/tenor.gif"),
                      height: 40,
                    )
                  ]),
              Center(
                child: Text(
                  "Cricket Match",
                  style: kHeadingTextStyle.copyWith(fontSize: 30),
                ),
              ),
              Center(
                child: Text(
                  "$score/$wicket",
                  style: kHeadingTextStyle.copyWith(
                    fontSize: 70,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "${CurrentOver.toStringAsFixed(1)} ($overs)",
                  style: kHeadingTextStyle.copyWith(
                    fontSize: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:16.0),
                child: Row(
                  children: [
                    ScoreButton('6',6),
                    ScoreButton('4',4),
                    ScoreButton('1',1),
                    ScoreButton('2',2),
                    ScoreButton('3',3),
                    ScoreButton('0',0),
                    ScoreButton('W',-1),
                    ScoreButton('R', -2)
                  ],
                ),
              ),
              Text('Team- $TeamOne',
              style: kHeadingTextStyle,)
            ],
          ),
        ),
      ),
    );;
  }
}


