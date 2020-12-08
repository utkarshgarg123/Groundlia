import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectSport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: SafeArea(
        child: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[900],
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(100.0)),
                    child: Image.asset(
                      "Assets/Images/appicon/Icon.png",
                      height: 100.0,
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: Text('What are you Playing Today?',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      print('hey');
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      color: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.sports_cricket,
                            size: 45,
                            color: Colors.white,
                          ),
                          Text('     Cricket',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 45,
                                fontFamily: "mainfont"
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      print('hey');
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      color: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.sports_soccer_outlined,
                            size: 45,
                            color: Colors.white,
                          ),
                          Text('      FootBall',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 45,
                                fontFamily: "mainfont"
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      print('hey');
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      color: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.sports_tennis_outlined,
                            size: 45,
                            color: Colors.white,
                          ),
                          Text('    Badminton',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 45,
                                fontFamily: "mainfont"
                            ),
                          )
                        ],
                      ),
                    ),
                  )

                ]
            ),
          ),
        ),
      ),
    );
  }
}
