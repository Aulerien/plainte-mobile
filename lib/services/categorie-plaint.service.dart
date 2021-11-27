import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:plainte/forms/save-plaint-form.dart';
import 'package:plainte/utils/globals.dart';
class CategoriePlaintService {


  /// list
  static Future<dynamic> list() async {
    var url = Globals.BASE_URL + '/categories/list';
    return await http.get(Uri.parse(url), headers: <String, String>{
      HttpHeaders.acceptHeader: 'application/json',
      'Authorization': 'bearer' + Globals.prefs.getString(Globals.KEY_API_TOKEN),
    },);
  }

}