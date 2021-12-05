import 'package:intl/intl.dart';
class TimeAgoService {
  static String timeAgo(DateTime dateTime) {
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    DateFormat dateTimeFormat = DateFormat('dd/MM/yyyy à HH:mm');
    DateFormat timeFormat = DateFormat('HH:mm');
    Duration diff = DateTime.now().difference(dateTime);
    if(diff.inDays > 30) { // return the date
      return dateTimeFormat.format(dateTime);
    }
    if(diff.inDays > 0) {
      if(diff.inDays == 1) {
        return "Hier à " + timeFormat.format(dateTime);
      }
      String jours = "jour" + ((diff.inDays > 1) ? "s" : "");
      return "Il y a " + diff.inDays.toString() + " " + jours;
    }
    if(diff.inHours > 0) {
      String heures = "heure" + ((diff.inHours > 1) ? "s" : "");
      return "Il y a " + diff.inHours.toString() + " " + heures;
    }
    if(diff.inMinutes > 0) {
      String minutes = "minute" + ((diff.inMinutes > 1) ? "s" : "");
      return "Il y a " + diff.inMinutes.toString() + " " + minutes;
    }
    //
    return "A l'instant";
  }
}