class BasketballScore {

  String organizer;
  String location;
  Data data = new Data();

  void orandlo(String organizer,String location){
    this.organizer = organizer;
    this.location = location;
  }

  void dataelements(var member1,String score1,var member2,String score2,String result,String datanew){
    this.data.elemnts(member1,score1,member2,score2,result,datanew);
  }

}

class Data {

  Team teamA = new Team();
  Team teamB = new Team();
  String result;
  String dataNew;

  void elemnts(var member1,String score1, var member2,String score2,String result,String datanew){
    this.result= result;
    this.dataNew = datanew;
    this.teamA.elments(member1, score1);
    this.teamB.elments(member2, score2);
  }

}

class Team {

  var members = List();
  String score;

  void elments(var m,String s){
    this.members.clear();
    this.members.addAll(m);
    this.score = s;
  }
}
