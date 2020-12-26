import 'dart:convert';
import 'package:groundlia/Pages/Api/storing_locally.dart';
import 'package:groundlia/Pages/Scores/cricket_score.dart';
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
    await Saving.writefile(info);
    print(res["identity"]);
    return res["identity"];
  }

  Future<void> createbadminton(String code,int players, List<String> team1, List<String> team2) async {
    print("team1: " + team1.toString());
    print("team2: " + team2.toString());
    String url = "https://ground-lia.herokuapp.com/badminton/update/" + code + "/no/no";
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "winner": "no",
        "new": "no",
        "Team_A": {
          "Members": team1,
          "Score": 0
        },
        "Team_B": {
          "Members": team2,
          "Score": 0
        }
      }),
    );

    print(response.body);
  }

  Future<void> createcricket(String code, List<String> team1, List<String> team2, String mode1, String mode2) async {
    print("in create cricket: " + mode1 + mode2);
    String url = "https://ground-lia.herokuapp.com/cricket/update/" + code + "/no/no";
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "winner": "no",
        "new": "no",
        "overs": "0.0",
        "Team_A": {
          "Members": team1,
          "Runs": 0,
          "Wickets": 0,
          "Mode": mode1
        },
        "Team_B": {
          "Members": team2,
          "Runs": 0,
          "Wickets": 0,
          "Mode": mode2
        }
      }),
    );

    print(response.body);
  }

  Future<void> endbadminton(String code)async{
    String url = "https://ground-lia.herokuapp.com/badminton/endresult/" + code;
    var response = await http.get(url);
    print("endres" + response.toString());
  }

  Future<void> endcricket(String code)async{
    String url = "https://ground-lia.herokuapp.com/cricket/endresult/" + code;
    var response = await http.get(url);
    print("endres" + response.toString());
  }

  Future<void> endbasketball(String code)async{
    String url = "https://ground-lia.herokuapp.com/basketball/endresult/" + code;
    var response = await http.get(url);
    print("endres" + response.toString());
  }

  Future<void> updatebadminton(String code,var Score) async {
    String url = "https://ground-lia.herokuapp.com/badminton/update/" + code + "/no/no";
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "winner": "no",
        "new": "no",
        "Team_A": {
          "Members": Score.data.teamA.members,
          "Score": int.parse(Score.data.teamA.score)
        },
        "Team_B": {
          "Members": Score.data.teamB.members,
          "Score": int.parse(Score.data.teamB.score)
        }
      }),
    );

    print(response.body);
  }

  Future<void> updatecricket(String code,CricketScore Score) async {
    String url = "https://ground-lia.herokuapp.com/cricket/update/" + code + "/no/no";
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "winner": "no",
        "new": "no",
        "overs": Score.data.overs,
        "Team_A": {
          "Members": Score.data.teamA.members,
          "Runs": int.parse(Score.data.teamA.runs),
          "Wickets": int.parse(Score.data.teamA.wicket),
          "Mode": Score.data.teamA.mode
        },
        "Team_B": {
          "Members": Score.data.teamB.members,
          "Runs": int.parse(Score.data.teamB.runs),
          "Wickets": int.parse(Score.data.teamB.wicket),
          "Mode": Score.data.teamB.mode
        }
      }),
    );

//    print(response.body);
  }

  Future<void> updatebasketball(String code,var Score) async {
    String url = "https://ground-lia.herokuapp.com/basketball/update/" + code + "/no/no";
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "winner": "no",
        "new": "no",
        "Team_A": {
          "Members": Score.data.teamA.members,
          "Score": int.parse(Score.data.teamA.score)
        },
        "Team_B": {
          "Members": Score.data.teamB.members,
          "Score": int.parse(Score.data.teamB.score)
        }
      }),
    );

    print(response.body);
  }



  Future<void> createbasketball(String code,int players, List<String> team1, List<String> team2) async {
    print("team1: " + team1.toString());
    print("team2: " + team2.toString());
    String url = "https://ground-lia.herokuapp.com/basketball/update/" + code + "/no/no";
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "winner": "no",
        "new": "no",
        "Team_A": {
          "Members": team1,
          "Score": 0
        },
        "Team_B": {
          "Members": team2,
          "Score": 0
        }
      }),
    );

    print(response.body);
  }

}