import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groundlia/Pages/util/widget.dart';

class PlayCricket extends StatefulWidget {
  int overs=10;
  List <String> TeamA=[], TeamB=[];
  @override
  _PlayCricketState createState() => _PlayCricketState();
}

class _PlayCricketState extends State<PlayCricket> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: SafeArea(
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
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(100.0)),
                      child: Image.asset(
                        "Assets/Images/appicon/Icon.png",
                        height: 100.0,
                      ),
                    ),
                    Text('Number of Overs',
//                      style: ,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
