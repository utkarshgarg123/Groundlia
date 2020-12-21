import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groundlia/Pages/player_data/Admin_file.dart';
import 'package:groundlia/Pages/util/widget.dart';

admin_file file = new admin_file();

class SelectSport extends StatelessWidget {

  Widget Options(IconData icon, String name,BuildContext context,double size){
    return GestureDetector(
      onTap: (){
        if(name == "Cricket"){
          Navigator.pushNamed(context, "/playCricket");
        }
        else if(name == "Basketball"){}
        else if(name == "Badminton"){}
        else{
          Navigator.pushNamed(context, "/watchwhich");
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10.0),
              child: Icon(
                icon,
                color: Colors.white,
                size: 40.0,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.0),
              child: Text(name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: size,
                    fontFamily: "mainfont"
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.grey[900],
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Heading("Editor Panel",context),
                Options(Icons.sports_cricket_outlined, "Cricket",context,45),
                Options(Icons.sports_basketball_outlined, "Basketball",context,45),
                Options(Icons.sports_tennis_outlined, "Badminton",context,45),
                Options(Icons.watch_later, "Watch Ongoing game\n(If Any)",context,25),
              ]
          ),
        ),
      ),
    );
  }
}
