import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:groundlia/Pages/Api/download.dart';
import 'package:groundlia/Pages/Extra/loading_container.dart';
import 'package:groundlia/Pages/Scores/badminton_score.dart';
import 'package:groundlia/Pages/util/Data.dart';
import 'package:groundlia/Pages/util/Listview.dart';
import 'package:groundlia/Pages/util/widget.dart';

download dn = new download();

class watchbadminton extends StatefulWidget {
  LData data;
  BadmintonScore Score = new BadmintonScore();
  watchbadminton(this.data,this.Score);

  @override
  _watchbadmintonState createState() => _watchbadmintonState();
}

class _watchbadmintonState extends State<watchbadminton> {

  Timer time;
  bool isloading = true;
  @override
  void initState(){
    time = new Timer.periodic(Duration(seconds: 2), (Timer t) => Update());
  print(widget.Score.data.dataNew);
    super.initState();
  }

  @override
  void dispose() {
    time.cancel();
    super.dispose();
  }

  void Update()async{
    download dn = download();
    await dn.BadmintonScore(widget.data).then((value) {
      widget.Score.dataelements(value["data"]["Team_A"]["Members"],
          value["data"]["Team_A"]["Score"].toString(),
          value["data"]["Team_B"]["Members"],
          value["data"]["Team_B"]["Score"].toString(),
          value["data"]["winner"].toString(),
          value["data"]["new"].toString());
    });
    setState((){isloading = false;});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[400],
        title: Text("Badminton Score Updates"),
      ),

      body: (isloading)?loading_container():Container(
        width: MediaQuery.of(context).size.width,
        child: (widget.Score.data.dataNew ==  "no")?SingleChildScrollView(
          child: Container(
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
                  child: Center(child: SingleChildScrollView(child: BadmintonEachGameScore(widget.Score, MediaQuery.of(context).size.width)))
                ),
                GestureDetector(
                  onTap: ()async {
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
          ),
        ):Center(
          child: Image.asset("Assets/Images/nothingfound/nothing_found.png"),
        ),
      ),
    );
  }
}
