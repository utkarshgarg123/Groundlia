import 'package:groundlia/Pages/util/Data.dart';

class download{

  Future<getCodes> GetAllCodes(SData data) async{
    var response = await "res";
    getCodes codes = getCodes();
    codes.OrganizerCode = "organizer";
    codes.VolunteerCode = "volunteer";
    codes.WatcherCode = "watcher";
    return codes;
  }

}