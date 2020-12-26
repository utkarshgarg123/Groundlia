

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextStyle kHeadingTextStyle= TextStyle(
color: Colors.white,
fontSize: 30,
fontFamily: "mainfont"
);

BorderRadius borderRadius(double border) {
  return BorderRadius.all(Radius.circular(border));
}

Future<void> dialog(BuildContext context){
  return showDialog<void>(
  context: context,
  barrierDismissible: false, // user must tap button!
  builder: (BuildContext context) {
  return AlertDialog(
      title: Text('Creating a new Game'),
      content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Make Sure Member1 of each team Should be the captian'),
            ],
          ),
      ),
        actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
              Navigator.of(context).pop();
              },
            ),
        ],
  );});
}

Card finalCard(var things,BuildContext context){
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    color: Colors.greenAccent[400],
    elevation: 10,
    child: Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.sports_bar,size: 40,),
              Text(things.team_name,style: TextStyle(fontSize: 30.0),),
            ],
          ),
          for(int i=0;i<things.team_members.length;i++)Text(things.team_members[i],style: TextStyle(fontSize: 30.0),),
      ],
      ),
    ),
  );
}