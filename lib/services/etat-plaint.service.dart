import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:plainte/utils/globals.dart';
class EtatPlaintService {

  /// list
  static Future<dynamic> list() async {
    var url = Globals.BASE_URL + '/etatplaintes/list';
    return await http.get(Uri.parse(url), headers: <String, String>{
      HttpHeaders.acceptHeader: 'application/json',
      'Authorization': 'bearer' + Globals.prefs.getString(Globals.KEY_API_TOKEN),
    },);
  }

  /// list
  static Future<dynamic> save() async {
    var url = Globals.BASE_URL + '/etatplaintes/create';
    return await http.post(Uri.parse(url),
      body: {
       'libelle': "CREE"
      },
      headers: <String, String>{
      HttpHeaders.acceptHeader: 'application/json',
      'Authorization': 'bearer' + Globals.prefs.getString(Globals.KEY_API_TOKEN),
    },);
  }

}