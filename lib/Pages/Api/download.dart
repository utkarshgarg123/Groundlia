import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:groundlia/Pages/util/Data.dart';

class download{

  Future<getCodes> GetAllCodes(SData data) async{
    var EncodeJson = jsonEncode(data.toJson());
    String json = await rootBundle.loadString('Samplejson/codes.json');
    print(json);
    Map gettingcodes = jsonDecode(json);
    getCodes codes = getCodes();
    codes.OrganizerCode = gettingcodes["organizercode"];
    codes.VolunteerCode = gettingcodes["volunteercode"];
    codes.WatcherCode = gettingcodes["watchercode"];
    return codes;
  }

  Future<String> CricketScore(){

  }

  Future<String> BasketballScore(){

  }
  Future<String> BadmintonScore(){

  }

}