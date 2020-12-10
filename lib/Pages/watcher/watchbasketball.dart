import 'package:flutter/material.dart';
import 'package:groundlia/Pages/Api/download.dart';
import 'package:groundlia/Pages/util/Data.dart';
import 'package:groundlia/Pages/util/Listview.dart';
import 'package:groundlia/Pages/util/widget.dart';

download dn = new download();

class watchbasketball extends StatefulWidget {
  LData data;
  Map<dynamic,dynamic> Score = {};
  watchbasketball(this.data,this.Score);

  @override
  _watchbasketballState createState() => _watchbasketballState();
}

class _watchbasketballState extends State<watchbasketball> {
  int number_of_games;

  @override
  void initState(){
    dn.BasketballScore(widget.data).then((value) => widget.Score.addAll(value));
    number_of_games = widget.Score["Total Match"];
    super.initState();
  }

  Update(){
    setState(() async {
      await dn.BasketballScore(widget.data).then((value) => widget.Score.addAll(value));
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
              Indicator(MediaQuery.of(context).size.width,"Organizer: "+widget.Score["Organizer"]),
              Indicator(MediaQuery.of(context).size.width,"Location: " +widget.Score["Location"]),
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
