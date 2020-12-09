import 'dart:convert';

import 'package:groundlia/Pages/util/Data.dart';

class upload{

  Future<String> IsAuthorized(LData code) async{
    var EncodeJson = jsonEncode(code.toJson());
    print(EncodeJson);
    return "watcher";
  }

}