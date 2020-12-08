import 'package:flutter/material.dart';
import 'package:groundlia/Pages/util/Data.dart';
import 'package:groundlia/Pages/util/widget.dart';

class watchbasketball extends StatefulWidget {
  LData data;
  watchbasketball(this.data);

  @override
  _watchbasketballState createState() => _watchbasketballState();
}

class _watchbasketballState extends State<watchbasketball> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent[400],
          title: Text("Basketball Score Updates"),
        ),
      body: Container(
        child: Center(
          child: Image.asset("Assets/Images/nothingfound/nothing_found.png"),
        ),
      ),
    );
  }
}
