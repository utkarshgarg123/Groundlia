class cricket_player{

  int number_of_overs;
  String team_name;
  List<String> team_members = [];

  void getting_players(int over,String name, List<String> members){
    this.number_of_overs = over;
    this.team_name = name;
    this.team_members.addAll(members);
  }

}