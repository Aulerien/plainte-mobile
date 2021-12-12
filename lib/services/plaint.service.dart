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
    if(savePlaintForm.fileSelected != null) {
      url = Globals.BASE_URL + '/plaintes/create-file';
    }
    Dio dio = new Dio();
    var files = [];
    if(savePlaintForm.fileSelected != null) {
      files.add(await MultipartFile.fromFile(savePlaintForm.fileSelected.path));
    }
    Map<String, dynamic> objectData = <String, dynamic> {
      "libelle" : savePlaintForm.description,
      "categorie" : savePlaintForm.categoryPlaint.id,
      "localisation" : savePlaintForm.localisation,
      "creator" : savePlaintForm.user.id,
      "etatplainte" : savePlaintForm.etatPlaint.id,
    };
    Map<String, dynamic> data = objectData;
    if(savePlaintForm.fileSelected != null) {
      data = <String, dynamic> {
        "fileprop" : "files",
        "filenumber" : 1,
        "filedata0" : files[0],
        "objectdata" : json.encode(objectData),
      };
    }
    FormData formData = new FormData.fromMap(data);
    return await dio.post(url, data: formData,
        options: Options(
          headers: <String, String>{
            'Authorization': 'bearer' + Globals.prefs.getString(Globals.KEY_API_TOKEN),
            HttpHeaders.acceptHeader: 'application/json',
          },
        )
    );
  }

  /// list
  static Future<dynamic> list() async {
    var url = Globals.BASE_URL + '/plaintes/list';
    return await http.get(Uri.parse(url), headers: <String, String>{
      HttpHeaders.acceptHeader: 'application/json',
      'Authorization': 'bearer' + Globals.prefs.getString(Globals.KEY_API_TOKEN),
    },);
  }

  /// reaction plaint
  static Future<dynamic> reaction(String plaintId, num voteUp, num voteDown) async {
    var url = Globals.BASE_URL + '/plaintes/update/' + plaintId;
    print(url);
    /*Dio dio = new Dio();
    Map<String, dynamic> objectData = <String, dynamic> {
      "voteUp" : voteUp,
      "voteDown" : voteDown,
    };
    FormData formData = new FormData.fromMap(objectData);*/
    /*return await dio.post(url, data: formData,
        options: Options(
          headers: <String, String>{
            'Authorization': 'bearer' + Globals.prefs.getString(Globals.KEY_API_TOKEN),
            HttpHeaders.acceptHeader: 'application/json',
          },
        )
    );*/
    return await http.post(Uri.parse(url),
      body: {
        "voteUp" : voteUp.toString(),
        "voteDown" : voteDown.toString(),
      },
      headers: <String, String>{
        HttpHeaders.acceptHeader: 'application/json',
        'Authorization': 'bearer' + Globals.prefs.getString(Globals.KEY_API_TOKEN),
      },);

  }

}