class CricketScore {
  CricketScore({
    this.organizer,
    this.location,
    this.data,
  });

  String organizer;
  String location;
  Data data;

  factory CricketScore.fromJson(Map<String, dynamic> json) => CricketScore(
    organizer: json["organizer"],
    location: json["location"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "organizer": organizer,
    "location": location,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.teamA,
    this.teamB,
    this.result,
    this.dataNew,
  });

  Team teamA;
  Team teamB;
  String result;
  String dataNew;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    teamA: Team.fromJson(json["Team_A"]),
    teamB: Team.fromJson(json["Team_B"]),
    result: json["result"],
    dataNew: json["new"],
  );

  Map<String, dynamic> toJson() => {
    "Team_A": teamA.toJson(),
    "Team_B": teamB.toJson(),
    "result": result,
    "new": dataNew,
  };
}

class Team {
  Team({
    this.members,
    this.score,
  });

  List<dynamic> members;
  String score;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    members: List<dynamic>.from(json["Members"].map((x) => x)),
    score: json["Score"],
  );

  Map<String, dynamic> toJson() => {
    "Members": List<dynamic>.from(members.map((x) => x)),
    "Score": score,
  };
}
