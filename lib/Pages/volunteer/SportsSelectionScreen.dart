import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groundlia/Pages/util/widget.dart';

class SelectSport extends StatelessWidget {

  Widget Options(IconData icon, String name){
    return GestureDetector(
      onTap: (){
        print('hey');
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
                    fontSize: 45,
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
                Heading("Choose Game"),
//                  ClipRRect(
//                    borderRadius: BorderRadius.all(Radius.circular(100.0)),
//                    child: Image.asset(
//                      "Assets/Images/appicon/Icon.png",
//                      height: 100.0,
//                    ),
//                  ),
//
//                  Container(
//                    padding: EdgeInsets.symmetric(vertical: 40),
//                    child: Text('What are you Playing Today?',
//                      style: TextStyle(
//                        fontSize: 20,
//                        color: Colors.white,
//                      ),
//                    ),
//                  ),
                Options(Icons.sports_cricket_outlined, "Cricket"),
                Options(Icons.sports_basketball_outlined, "Basketball"),
                Options(Icons.sports_tennis_outlined, "Badminton"),
              ]
          ),
        ),
      ),
    );
  }
}
