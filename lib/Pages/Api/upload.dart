import 'dart:convert';
import 'package:groundlia/Pages/Api/storing_locally.dart';
import 'package:http/http.dart' as http;
import 'package:groundlia/Pages/util/Data.dart';

class upload{

  Future<String> IsAuthorized(LData code) async{
    String url = "https://ground-lia.herokuapp.com/mainpage/" + code.code;
    var response = await http.get(url);
    Map<dynamic, dynamic> res = jsonDecode(response.body);
    saving Saving = new saving();
    admininfo info = new admininfo();
    info.name = res["orgmember"]["name"];
    info.location = res["orgmember"]["location"];
    info.mail = res["orgmember"]["email"];
    info.organizerCode = res["orgmember"]["organisercode"];
    info.volunteerCode = res["orgmember"]["vollentiercode"];
    info.watcherCode = res["orgmember"]["watchercode"];
    Saving.writefile(info);
    print(res["identity"]);
    return res["identity"];
  }
}