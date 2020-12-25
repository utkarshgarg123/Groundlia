class CricketScore {

  String organizer;
  String location;
  Data data = new Data();

  void orandlo(String organizer,String location){
    this.organizer = organizer;
    this.location = location;
  }

  void dataelements(var member1,String score1,var member2,String score2,String result,String datanew,String wicket1,String wicket2,String mode1,String mode2){
    this.data.elemnts(member1,score1,member2,score2,result,datanew,wicket1,wicket2,mode1,mode2);
  }

}

class Data {

  Team teamA = new Team();
  Team teamB = new Team();
  String result;
  String dataNew;

  void elemnts(var member1,String score1, var member2,String score2,String result,String datanew,String wicket1,String wicket2,String mode1,String mode2){
    this.result= result;
    this.dataNew = datanew;
    this.teamA.elments(member1, score1, wicket1, mode1);
    this.teamB.elments(member2, score2, wicket1, mode1);
  }

}

class Team {

  var members = List();
  String runs;
  String wicket;
  String mode;

  void elments(var m,String r,String w,String mode){
    this.members.clear();
    this.members.addAll(m);
    this.runs = r;
    this.wicket = w;
    this.mode = mode;
  }
}
