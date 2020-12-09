import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:groundlia/Pages/Extra/loading.dart';
import 'package:groundlia/Pages/util/Data.dart';
import 'package:groundlia/Pages/util/widget.dart';

class Done extends StatefulWidget {
  LData data;
  Done(this.data);

  @override
  _DoneState createState() => _DoneState();
}

class _DoneState extends State<Done> {
  
  var random = new Random();

  @override
  void initState() {
    Timer(Duration(seconds: random.nextInt(5)), (){
      Navigator.of(context).pop(true);
      if(widget.data.Authorisation == "Organizer"){}
      else if(widget.data.Authorisation == "Volunteer"){}
      else{Navigator.pushNamed(context, "/watchwhich");}
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: Container(
          color: Colors.grey[900],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30.0),
                  child: Text("Loading....", style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.greenAccent[400],
                    fontFamily: "mainfont",
                  ),),
                ),
                SizedBox(height: 20.0,),
                loading1(color: Colors.lightGreen[400]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
