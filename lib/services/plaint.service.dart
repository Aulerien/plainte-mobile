import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:plainte/models/plaint.dart';
import 'package:plainte/utils/globals.dart';
class PlaintService {
  final String baseUrl = "plaint";

  /// send plaint
  Future<dynamic> sendPlaint(Plaint plaint, PlatformFile fileSelected) async {
    var url = Globals.BASE_URL + 'save';
    Dio dio = new Dio();
    FormData formData = new FormData.fromMap({
    "plaint" : jsonEncode(plaint),
    "file" : fileSelected != null ? await MultipartFile.fromFile(fileSelected.path) : null
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