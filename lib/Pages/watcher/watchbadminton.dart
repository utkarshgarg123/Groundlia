import 'package:flutter/material.dart';
import 'package:groundlia/Pages/util/Data.dart';
import 'package:groundlia/Pages/util/widget.dart';

class watchbadminton extends StatefulWidget {
  LData data;
  watchbadminton(this.data);

  @override
  _watchbadmintonState createState() => _watchbadmintonState();
}

class _watchbadmintonState extends State<watchbadminton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[400],
        title: Text("Badminton Score Updates"),
      )
    );
  }
}
