import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:groundlia/Pages/Api/download.dart';
import 'package:groundlia/Pages/Extra/loading.dart';
import 'package:groundlia/Pages/Extra/loading_container.dart';
import 'package:groundlia/Pages/util/Data.dart';

SData data2 = SData();
getCodes codes = getCodes();

class signup extends StatefulWidget {
  LData data1;
  signup(this.data1);

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {

  bool isloading = false;

  Widget Input(String symbol, String hint){
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      width: MediaQuery.of(context).size.width - 100,
      padding: EdgeInsets.all(5.0),
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
                  if(symbol == "user") data2.name = val;
                  else if(symbol == "mail") data2.mail = val;
                  else data2.location = val;
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
    data2.name = "";
    data2.location = "";
    data2.mail = "";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
//          resizeToAvoidBottomInset: false,
          body: (!isloading)?Container(
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
                Input("mail", "Enter Email"),
                Input("location", "Enter location"),
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      isloading = true;
                    });
                    download dn = download();
                    if(data2.name != "" && data2.mail != "" && data2.location != "")
                    codes = await dn.GetAllCodes(data2);

                    if(codes.OrganizerCode != "") {
                      widget.data1.code = codes.OrganizerCode;
                      print(codes.OrganizerCode);
                      print(codes.VolunteerCode);
                      print(codes.WatcherCode);
                      Navigator.of(context).pop(true);
                      Navigator.of(context).pop(true);
                      Navigator.pushNamed(context, "/startevent");
                    }
                    else{
                      Fluttertoast.showToast(
                          msg: "Error in signup or\nsignup Credentials are wrong",
                          backgroundColor: Colors.black,
                          textColor: Colors.white);
                      setState(() {
                        isloading = false;
                      });
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(top: 20.0),
                    decoration: BoxDecoration(
                        color: Colors.lightGreen[400],
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Text("Start the Event", style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: "mainfont",
                    ),),
                  ),
                )
              ],
            ),
          ):loading_container(),
        )
    );
  }
}
