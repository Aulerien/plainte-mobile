import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:plainte/forms/save-plaint-form.dart';
import 'package:plainte/utils/globals.dart';
class PlaintService {

  /// send plaint
  static Future<dynamic>  sendPlaint(SavePlaintForm savePlaintForm) async {
    var url = Globals.BASE_URL + '/admins/plaint/save';
    Dio dio = new Dio();
    FormData formData = new FormData.fromMap({
    "plaint" : savePlaintForm.toJson(),
    "file" : savePlaintForm.fileSelected != null ? await MultipartFile.fromFile(savePlaintForm.fileSelected.path) : null
    });
    return await dio.post(url, data: formData,
        options: Options(
          headers: <String, String>{
            HttpHeaders.authorizationHeader: Globals.prefs.getString(Globals.KEY_API_TOKEN),
            HttpHeaders.acceptHeader: 'application/json',
          },
        )
    );
  }

}