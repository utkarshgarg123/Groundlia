import 'package:flutter/material.dart';
import 'package:groundlia/Pages/signup.dart';
import 'package:groundlia/Pages/util/widget.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: SafeArea(
            child: Scaffold(
//              resizeToAvoidBottomInset: false,
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
                            child: Image.asset("Assets/Images/loginSignup/key.png", height: 40.0,),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 200,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Access Code",
                              ),
                              onChanged: (val){
                                setState(() {

                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 45.0,
                            width: 70.0,
                            margin: EdgeInsets.only(top: 20.0),
                            decoration: BoxDecoration(
                                color: Colors.lightGreen[300],
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: Center(child: Text("Done", style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                              fontFamily: "mainfont",
                            ),),),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, "/signup");
                          },
                          child: Container(
                            height: 45.0,
                            width: MediaQuery.of(context).size.width - 140,
                            margin: EdgeInsets.only(top: 20.0),
                            decoration: BoxDecoration(
                                color: Colors.lightGreen[300],
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: Center(child: Text("Signup for Organizer", style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                              fontFamily: "mainfont",
                            ),),),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
        ),
        onWillPop: onWillPop);
  }
}
