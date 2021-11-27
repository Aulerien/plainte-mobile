import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:plainte/forms/save-plaint-form.dart';
import 'package:plainte/utils/globals.dart';
class PlaintService {

  /// send plaint
  static Future<dynamic>  savePlaint(SavePlaintForm savePlaintForm) async {
    var url = Globals.BASE_URL + '/plaintes/create';
    Dio dio = new Dio();
    var files = [];
    if(savePlaintForm.fileSelected != null) {
      files.add(await MultipartFile.fromFile(savePlaintForm.fileSelected.path));
    }
    FormData formData = new FormData.fromMap({
    "libelle" : savePlaintForm.description,
    "localisation" : savePlaintForm.localisation,
    "files" : files
    });
    return await dio.post(url, data: formData,
        options: Options(
          headers: <String, String>{
            'Authorization': 'bearer' + Globals.prefs.getString(Globals.KEY_API_TOKEN),
            HttpHeaders.acceptHeader: 'application/json',
          },
        )
    );
  }

  /// register
  static Future<dynamic> list() async {
    var url = Globals.BASE_URL + '/plaintes/list';
    return await http.get(Uri.parse(url), headers: <String, String>{
      HttpHeaders.acceptHeader: 'application/json',
      'Authorization': 'bearer' + Globals.prefs.getString(Globals.KEY_API_TOKEN),
    },);
  }

}