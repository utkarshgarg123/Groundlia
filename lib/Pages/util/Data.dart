class LData{
  String name = "";
  String code = "";
  String Authorisation = "";

  LData({
    this.name,
    this.code,
    this.Authorisation,
  });

  LData.fromJson(Map json)
      : name = json['name'],
      code = json['code'],
      Authorisation = json['authorisation'];

  Map<String,String> toJson() => {
    'name' : name,
    'code' : code,
  };

}

class SData{
  String name = "";
  String mail = "";
  String location = "";

  SData({
    this.name,
    this.mail,
    this.location,
  });

  SData.toJson(Map json)
      : name = json['name'],
        mail = json['mail'],
        location = json['location'];

  Map<String,String> toJson() => {
    'name' : name,
    'mail' : mail,
    'location' : location,
  };


}

class getCodes{
  String WatcherCode = "";
  String VolunteerCode = "";
  String OrganizerCode = "";
}