import 'package:flutter/material.dart';

import 'loading.dart';

Widget loading_container(){
  return Container(
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
  );
}