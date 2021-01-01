import 'dart:convert';
import 'dart:io';

import 'package:groundlia/Pages/Api/download.dart';
import 'package:path_provider/path_provider.dart';

class admininfo {
  admininfo({
    this.name,
    this.mail,
    this.location,
    this.watcherCode,
    this.volunteerCode,
    this.organizerCode,
  });

  String name;
  String mail;
  String location;
  String watcherCode;
  String volunteerCode;
  String organizerCode;

  factory admininfo.fromJson(Map<String, dynamic> json) =>
      admininfo(
        name: json["name"],
        mail: json["mail"],
        location: json["location"],
        watcherCode: json["WatcherCode"],
        volunteerCode: json["VolunteerCode"],
        organizerCode: json["OrganizerCode"],
      );

  Map<String, dynamic> toJson() =>
      {
        "name": name,
        "mail": mail,
        "location": location,
        "WatcherCode": watcherCode,
        "VolunteerCode": volunteerCode,
        "OrganizerCode": organizerCode,
      };
}

class saving{
  Future<String> get file_directory async{
    var dir = await getExternalStorageDirectory();
    return dir.path;
  }

  Future<File> adminfile() async{
    final String file_name = "adminfile";
    final path = await file_directory;
    return File("$path/$file_name.txt");
  }

  writefile(admininfo name) async{
    try{
      final file = await adminfile();
      String tojson = await jsonEncode(name);
      await file.writeAsString(tojson);
    }catch(e){
      print("errorwritting: #e");
    }
  }

  Future<Map> readfile() async {
    try {
      final file = await adminfile();
      String fromjson;
      await file.readAsString().then((value) => fromjson = value);
      Map<dynamic, dynamic> datastored = Map<dynamic, dynamic>.from(jsonDecode(fromjson));
      return datastored;
    } catch (e) {
      Map m  = {};
      print("error: $e");
      return m;
    }
  }
}

class relogin{
  Future<String> get file_directory async{
    var dir = await getExternalStorageDirectory();
    return dir.path;
  }

  Future<File> loginfile() async{
    final String file_name = "logincredentials";
    final path = await file_directory;
    return File("$path/$file_name.txt");
  }

  writefile(String name) async{
    try{
      final file = await loginfile();
      String tojson = await jsonEncode(name);
      await file.writeAsString(tojson);
    }catch(e){
      print("errorwritting: #e");
    }
  }

  Future<String> readfile() async {
    try {
      final file = await loginfile();
      String fromjson;
      await file.readAsString().then((value) => fromjson = value);
      String datastored = jsonDecode(fromjson);
      print(datastored);
      return datastored;
    } catch (e) {
      String m = "";
      print("error: $e");
      return m;
    }
  }
}