import 'package:groundlia/Pages/player_data/badminton_players.dart';
import 'package:groundlia/Pages/player_data/basketball_players.dart';
import 'package:groundlia/Pages/player_data/cricket_players.dart';

class admin_file{

  List<cricket_player> cricket = [];
  List<basketball_player> basketball = [];
  List<badminton_player> badminton = [];

  void saving_cricket_players(cricket_player team){
    if(cricket.length >= 2) cricket.clear();
      cricket.add(team);
  }

  void saving_basketball_players(basketball_player team){
    if(basketball.length >= 2) basketball.clear();
    basketball.add(team);
  }

  void saving_badminton_players(badminton_player team){
    if(badminton.length >= 2) badminton.clear();
    badminton.add(team);
  }

}