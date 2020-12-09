import 'package:flutter/material.dart';
import 'package:groundlia/Pages/util/Data.dart';
import 'package:groundlia/Pages/util/widget.dart';

class Startevent extends StatefulWidget {
  SData data;
  getCodes codes;
  Startevent(this.data, this.codes);

  @override
  _StarteventState createState() => _StarteventState();
}

class _StarteventState extends State<Startevent> {

  getCodes Showcodes = getCodes();

  @override
  void initState() {
    Showcodes = widget.codes;
    super.initState();
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
