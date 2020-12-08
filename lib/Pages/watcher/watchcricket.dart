import 'package:flutter/material.dart';
import 'package:groundlia/Pages/util/Data.dart';

class watchcricket extends StatefulWidget {
  LData data;
  watchcricket(this.data);

  @override
  _watchcricketState createState() => _watchcricketState();
}

class _watchcricketState extends State<watchcricket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent[400],
          title: Text("Cricket Score Updates"),
        ),

      body: Container(
        child: Center(
          child: Image.asset("Assets/Images/nothingfound/nothing_found.png"),
        ),
      ),
    );
  }
}
