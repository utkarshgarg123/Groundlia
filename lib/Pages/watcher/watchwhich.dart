import 'package:flutter/material.dart';
import 'package:groundlia/Pages/util/widget.dart';

class watchwhich extends StatefulWidget {
  @override
  _watchwhichState createState() => _watchwhichState();
}

class _watchwhichState extends State<watchwhich> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.grey[900],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  height: 50.0,
                  width: MediaQuery.of(context).size.width - 50,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Center(child: Text("Choose the game" ,style: TextStyle(
                    fontFamily: "mainfont",
                    fontSize: 35.0,
                  ),)),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/watchcricket");
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20.0),
                    height: 50.0,
                    width: MediaQuery.of(context).size.width - 100,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent[400],
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Center(child: Text("Cricket",style: TextStyle(
                      fontFamily: "mainfont",
                      fontSize: 35.0,
                    ),)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/watchbadminton");
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20.0),
                    height: 50.0,
                    width: MediaQuery.of(context).size.width - 100,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent[400],
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Center(child: Text("Badminton",style: TextStyle(
                      fontFamily: "mainfont",
                      fontSize: 35.0,
                    ),)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/watchbasketball");
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20.0),
                    height: 50.0,
                    width: MediaQuery.of(context).size.width - 100,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent[400],
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Center(child: Text("BasketBall",style: TextStyle(
                      fontFamily: "mainfont",
                      fontSize: 35.0,
                    ),)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(true);
                    Navigator.pushNamed(context, "/login");
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20.0),
                    height: 50.0,
                    width: MediaQuery.of(context).size.width - 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Center(child: Text("Back to login screen",style: TextStyle(
                      fontFamily: "mainfont",
                      fontSize: 30.0,
                    ),)),
                  ),
                ),
              ],
            ),
          ),
        ),
        onWillPop: onWillPop);
  }
}

