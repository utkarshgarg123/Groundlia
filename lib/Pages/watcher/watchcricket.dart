import 'dart:async';

import 'package:flutter/material.dart';
import 'package:groundlia/Pages/Api/download.dart';
import 'package:groundlia/Pages/Extra/loading_container.dart';
import 'package:groundlia/Pages/Scores/cricket_score.dart';
import 'package:groundlia/Pages/util/Data.dart';
import 'package:groundlia/Pages/util/Listview.dart';
import 'package:groundlia/Pages/util/widget.dart';

download dn = new download();

class watchcricket extends StatefulWidget {
  LData data;
  CricketScore Score = new CricketScore();
  watchcricket(this.data, this.Score);

  @override
  _watchcricketState createState() => _watchcricketState();
}

class _watchcricketState extends State<watchcricket> {

  Timer time;
  bool isloading = true;
  @override
  void initState(){
    time = new Timer.periodic(Duration(seconds: 2), (Timer t) => Update());
    super.initState();
  }

  @override
  void dispose() {
    time.cancel();
    super.dispose();
  }

  Update() async {
    download dn = download();
    await dn.CricketScore(widget.data).then((value) {
      widget.Score.dataelements(value["data"]["Team_A"]["Members"],
        value["data"]["Team_A"]["Runs"].toString(),
        value["data"]["Team_B"]["Members"],
        value["data"]["Team_B"]["Runs"].toString(),
        value["data"]["winner"].toString(),
        value["data"]["new"].toString(),
        value["data"]["Team_A"]["Wickets"].toString(),
        value["data"]["Team_B"]["Wickets"].toString(),
        value["data"]["Team_A"]["Mode"],
        value["data"]["Team_B"]["Mode"],
        value["data"]["overs"],
      );
    });
    setState(() {isloading = false;});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[400],
        title: Text("Cricket Score Updates"),
      ),

      body: (isloading)?loading_container():Container(
        width: MediaQuery.of(context).size.width,
        child: (widget.Score.data.dataNew ==  "no")?Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Indicator(MediaQuery.of(context).size.width,"Organizer: "+ widget.Score.organizer),
              Indicator(MediaQuery.of(context).size.width,"Location: " + widget.Score.location),
              Container(
                  margin: EdgeInsets.only(top: 10.0),
                  width: MediaQuery.of(context).size.width-40.0,
                  height: MediaQuery.of(context).size.height-270,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Center(child: SingleChildScrollView(child: CricketEachGameScore(widget.Score, MediaQuery.of(context).size.width)))
              ),
              GestureDetector(
                onTap: ()async {
                  setState(() {
                    isloading = true;
                  });
                  await Update();
                },
                child: Container(
                  padding: EdgeInsets.only(left: 10.0,right: 10.0,top: 5.0,bottom: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent[400],
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  margin: EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.refresh),
                      Text("Refresh"),
                    ],
                  ),
                ),
              )
            ],
          ),
        ):Center(
          child: Image.asset("Assets/Images/nothingfound/nothing_found.png"),
        ),
      ),
    );
  }
}