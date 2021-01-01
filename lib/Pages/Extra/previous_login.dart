import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:groundlia/Pages/Api/storing_locally.dart';
import 'package:groundlia/Pages/Extra/loading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:groundlia/Pages/Extra/loading_container.dart';
import 'package:groundlia/Pages/util/Data.dart';
import 'package:groundlia/Pages/util/widget.dart';

class Relogin extends StatefulWidget {
  LData data;
  getCodes codes;
  Relogin(this.data, this.codes);


  @override
  _ReloginState createState() => _ReloginState();
}

class _ReloginState extends State<Relogin> {

  var random = new Random();

  @override
  void initState() {
    Timer(Duration(seconds: random.nextInt(5)), (){
      relogin login = relogin();
      login.readfile().then((value) {
        saving sv = new saving();
        if(value == "Organiser"){
          sv.readfile().then((value) {
            widget.data.Authorisation = "Organizer";
            widget.data.code = value["OrganizerCode"];
            widget.codes.OrganizerCode = value["OrganizerCode"];
            widget.codes.VolunteerCode = value["VolunteerCode"];
            widget.codes.WatcherCode = value["WatcherCode"];
            Navigator.of(context).pop(true);
            Navigator.pushNamed(context, "/startevent");
          });
        }
        else if(value == "Volunteer"){
          sv.readfile().then((value) {
            widget.data.Authorisation = "Volunteer";
            widget.data.code = value["VolunteerCode"];
            Navigator.of(context).pop(true);
            Navigator.pushNamed(context, "/selectsport");
          });
        }
        else if(value == "Watcher"){
          sv.readfile().then((value) {
            widget.data.Authorisation = "Watcher";
            widget.data.code = value["WatcherCode"];
            Navigator.of(context).pop(true);
            Navigator.pushNamed(context, "/watchwhich");
          });
        }
        else{
          Fluttertoast.showToast(
              msg: "Error in login\nor the login credentials are wrong",
              backgroundColor: Colors.black,
              textColor: Colors.white);
          Navigator.of(context).pop(true);
        }
      });
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
