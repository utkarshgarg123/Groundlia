import 'dart:async';

import 'package:flutter/material.dart';
import 'package:groundlia/Pages/util/Data.dart';
import 'package:groundlia/Pages/util/widget.dart';

class Startevent extends StatefulWidget {
  SData data;
  getCodes codes;
  getCodes CODES;
  Startevent(this.data, this.codes,this.CODES);

  @override
  _StarteventState createState() => _StarteventState();
}

class _StarteventState extends State<Startevent> {

  getCodes Showcodes = getCodes();
  Timer time;

  @override
  void initState() {
    if(widget.codes.VolunteerCode != "") Showcodes = widget.codes;
    else Showcodes = widget.CODES;
    time =  new Timer.periodic(Duration(milliseconds: 200),(Timer t) => setState((){}));
    super.initState();
  }

  @override
  void dispose() {
    time.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: SafeArea(
          child: Scaffold(
              body: Container(
                color: Colors.grey[800],
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(height: 5.0,),
                    Heading("Event Codes",context),
                    showCodes(Showcodes.OrganizerCode.toString().toString(),"Organizers:- " + Showcodes.OrganizerCode.toString().toString(), MediaQuery.of(context).size.width,context),
                    showCodes(Showcodes.VolunteerCode.toString().toString(),"Volunteers:- " + Showcodes.VolunteerCode.toString().toString(), MediaQuery.of(context).size.width,context),
                    showCodes(Showcodes.WatcherCode.toString().toString(),"Watchers:- " + Showcodes.WatcherCode.toString().toString(), MediaQuery.of(context).size.width,context),
                    EnterGame("Enter Game",context),
                  ],
                ),
              ),
          ),
        ),
        onWillPop: onWillPop
    );
  }
}
