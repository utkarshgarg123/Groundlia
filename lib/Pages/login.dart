import 'package:flutter/material.dart';
import 'package:groundlia/Pages/Api/upload.dart';
import 'package:groundlia/Pages/util/Data.dart';
import 'package:groundlia/Pages/util/widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

LData data1 = LData();

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {

  Widget Input(String symbol, String hint){
    return Container(
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
            child: Image.asset("Assets/Images/loginSignup/$symbol.png", height: 40.0,),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 200,
            child: TextField(
              decoration: InputDecoration(
                hintText: hint,
              ),
              onChanged: (val){
                setState(() {
                  if(symbol == "user") data1.name = val;
                  else data1.code = val;
                });
              },
            ),
          )
        ],
      ),
    );
  }

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
                      child: Image.asset("Assets/Images/appicon/Icon.png", height: 100.0,),
                    ),
                    Input("user", "Enter Name"),
                    Input("key", "Access code"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            upload up = upload();
                            if(data1.name != null || data1.code != null)
                            data1.Authorisation = await up.IsAuthorized(data1);
                            if
                            (data1.Authorisation == "watcher" ||
                                data1.Authorisation == "organizer" ||
                                data1.Authorisation == "volunteer"
                            ){
                            Navigator.of(context).pop(true);
                            Navigator.pushNamed(context, "/done");
                            }
                            else {
                                  Fluttertoast.showToast(
                                  msg: "Error in login\nor the login credentials are wrong",
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white);
                            }
                          },
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
