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

  Future<Map<dynamic,dynamic>> CricketScore(LData data) async{
    String json = await rootBundle.loadString('Samplejson/Cricketscore.json');
    Map gettingScore = jsonDecode(json);
    print(gettingScore);
    return gettingScore;
  }

  Future<Map<dynamic,dynamic>> BasketballScore(LData data) async{
    String json = await rootBundle.loadString('Samplejson/Basketballscore.json');
    Map gettingScore = jsonDecode(json);
    print(gettingScore);
    return gettingScore;
  }
  Future<Map<dynamic,dynamic>> BadmintonScore(LData data) async{
    String json = await rootBundle.loadString('Samplejson/Badmintonscore.json');
    Map gettingScore = jsonDecode(json);
    print(gettingScore);
    return gettingScore;

  }

}