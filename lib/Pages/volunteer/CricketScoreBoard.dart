import 'package:flutter/material.dart';
import 'package:groundlia/Pages/util/Constants.dart';

class CricketScoreBoard extends StatelessWidget {
  int score=0,wicket=0;
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
                    Image(image: AssetImage("Assets/Images/appicon/tenor.gif"),
                    height: 40,)
                          
                  ]),
                Center(
                  child: Text("Cricket Match",
                    style: kHeadingTextStyle.copyWith(fontSize: 30),
                  ),

                ),
              Center(
                child: Text("$score/$wicket"
                ,
                style: kHeadingTextStyle.copyWith(fontSize: 70,
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}

