import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:groundlia/Pages/Extra/loading.dart';
import 'package:groundlia/Pages/Extra/loading_container.dart';
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
      if(widget.data.Authorisation == "Organiser"){
        Navigator.pushNamed(context, "/startevent");
      }
      else if(widget.data.Authorisation == "Volunteer"){
        Navigator.pushNamed(context, "/selectsport");
      }
      else{Navigator.pushNamed(context, "/watchwhich");}
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: loading_container(),
      ),
    );
  }
}
