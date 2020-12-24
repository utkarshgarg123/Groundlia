import 'dart:convert';
import 'package:groundlia/Pages/Api/storing_locally.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;
import 'package:groundlia/Pages/util/Data.dart';

class download{

  Future<getCodes> GetAllCodes(SData data) async{
//    https://ground-lia.herokuapp.com/organisers/hal/name@gmail.com/local
    String url = "https://ground-lia.herokuapp.com/organisers/" + data.name + "/" + data.mail + "/" + data.location;
    var response = await http.get(url);
    Map<dynamic, dynamic> res = jsonDecode(response.body.toString());
    print(res["organisercode"]);
    print(res["vollentiercode"]);
    print(res["watchercode"]);
    getCodes codes = getCodes();
    saving Saving = new saving();
    admininfo info = new admininfo();
    info.name = data.name;
    info.location = data.location;
    info.mail = data.mail;
    info.organizerCode = res["organisercode"];
    info.volunteerCode = res["vollentiercode"];
    info.watcherCode = res["watchercode"];
    Saving.writefile(info);
    codes.OrganizerCode = res["organisercode"];
    codes.VolunteerCode = res["vollentiercode"];
    codes.WatcherCode = res["watchercode"];
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