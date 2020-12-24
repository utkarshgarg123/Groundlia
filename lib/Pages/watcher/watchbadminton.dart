import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:groundlia/Pages/Api/download.dart';
import 'package:groundlia/Pages/Api/storing_locally.dart';
import 'package:groundlia/Pages/util/Data.dart';
import 'package:groundlia/Pages/util/Listview.dart';
import 'package:groundlia/Pages/util/widget.dart';

download dn = new download();

class watchbadminton extends StatefulWidget {
  LData data;
  Map<dynamic,dynamic> Score = {};
  watchbadminton(this.data,this.Score);

  @override
  _watchbadmintonState createState() => _watchbadmintonState();
}

class _watchbadmintonState extends State<watchbadminton> {
  int number_of_games;
  String organizer,location;
  void asyncfunction (){
    saving sav = new saving();
    setState(() async {
      await sav.readfile().then((value){organizer = value["name"]; location = value["location"];});
    });
  }

  @override
  void initState(){
    dn.BadmintonScore(widget.data).then((value) => widget.Score.addAll(value));
    asyncfunction();
    number_of_games = widget.Score["Total Match"];
    super.initState();
  }

  Update(){
    setState(() async {
      await dn.BadmintonScore(widget.data).then((value) => widget.Score.addAll(value));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[400],
        title: Text("Basketball Score Updates"),
      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        child: (number_of_games >= 1)?Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Indicator(MediaQuery.of(context).size.width,"Organizer: "+organizer),
              Indicator(MediaQuery.of(context).size.width,"Location: " +location),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                width: MediaQuery.of(context).size.width-40.0,
                height: MediaQuery.of(context).size.height-270,
                color: Colors.blue,
                child: ListView.builder(
                  itemCount: number_of_games,
                  itemBuilder: (context, position){
                    print(position);
                    return BasketballEachGameScore(widget.Score["Game" + (position + 1).toString()],MediaQuery.of(context).size.width);
                  },
                ),
              ),
              GestureDetector(
                onTap: (){
                  Update();
                },
                child: Container(
                  padding: EdgeInsets.all(5.0),
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
