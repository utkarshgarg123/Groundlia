import 'package:flutter/material.dart';
import 'package:groundlia/Pages/Api/upload.dart';
import 'package:groundlia/Pages/Extra/loading_container.dart';
import 'package:groundlia/Pages/util/Data.dart';
import 'package:groundlia/Pages/util/widget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:groundlia/Pages/Api/storing_locally.dart';

import 'Extra/loading.dart';

LData data1 = LData();

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {

  bool isloading = false;

  Widget Input(String symbol, String hint){
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      width: MediaQuery.of(context).size.width - 100,
      padding: EdgeInsets.all(5.0),
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
  void initState() {
    data1.name = "";
    data1.code = "";
    super.initState();
  }

 Widget button(String name){
    return GestureDetector(
      onTap: () async {
        if(name == "Done") {
          setState(() {
            isloading = true;
          });
          upload up = upload();
          if (data1.name != "" && data1.code != "")
            data1.Authorisation = await up.IsAuthorized(data1);
          if
          (data1.Authorisation == "Watcher" ||
              data1.Authorisation == "Organiser" ||
              data1.Authorisation == "Volunteer"
          ) {
            relogin login = relogin();
            await login.writefile(data1.Authorisation);
            Navigator.of(context).pop(true);
            Navigator.pushNamed(context, "/done");
          }
          else {
            Fluttertoast.showToast(
                msg: "Error in login\nor the login credentials are wrong",
                backgroundColor: Colors.black,
                textColor: Colors.white);
            setState(() {
              isloading = false;
            });
          }
        }
        else if(name == "Signup As Organizer"){
          Navigator.pushNamed(context, "/signup");
        }
        else if(name == "Previous login"){
          Navigator.pushNamed(context, "/relogin");
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 20.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.lightGreen[400],
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Text(name, style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          fontFamily: "mainfont",
        ),),
      ),
    );
 }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: SafeArea(
            child: Scaffold(
              body: (isloading)?loading_container():Container(
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        button("Previous login"),
                        button("Done"),
                      ],
                    ),
                    button("Signup As Organizer"),
                  ],
                ),
              ),
            )
        ),
        onWillPop: onWillPop);
  }
}
