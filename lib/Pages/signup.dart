import 'package:flutter/material.dart';
import 'package:groundlia/Pages/util/widget.dart';

class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {

  String name,email,location;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
//          resizeToAvoidBottomInset: false,
          body: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[900],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  child: Image.asset("Assets/Images/appicon/Icon.png", height: 100.0,),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.0),
                  width: MediaQuery.of(context).size.width - 100,
                  height: 50.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(100.0)),
                        child: Image.asset("Assets/Images/loginSignup/user.png", height: 40.0,),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 200,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Enter Name",
                          ),
                          onChanged: (val){
                            setState(() {
                              name = val;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  width: MediaQuery.of(context).size.width - 100,
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        child: Image.asset("Assets/Images/loginSignup/mail.png", height: 40.0,),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 200,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Enter Email",
                          ),
                          onChanged: (val){
                            setState(() {
                              email = val;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  width: MediaQuery.of(context).size.width - 100,
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(100.0)),
                        child: Image.asset("Assets/Images/loginSignup/location.png", height: 40.0,),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 200,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Location",
                          ),
                          onChanged: (val){
                            setState(() {
                              location = val;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  child: Container(
                    height: 45.0,
                    width: 150.0,
                    margin: EdgeInsets.only(top: 20.0),
                    decoration: BoxDecoration(
                        color: Colors.lightGreen[300],
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Center(child: Text("Start the Event", style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: "mainfont",
                    ),),),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
