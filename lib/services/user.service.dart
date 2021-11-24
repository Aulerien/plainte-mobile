import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:plainte/forms/login-form.dart';
import 'package:plainte/models/plaint.dart';
import 'package:plainte/utils/globals.dart';
class PlaintService {

  /// login
  Future<dynamic> login(LoginForm loginForm) async {
    var url = Globals.BASE_URL + 'login';
    Dio dio = new Dio();
    return await dio.post(url, data: loginForm,
        options: Options(
          headers: <String, String>{
            HttpHeaders.authorizationHeader: Globals.prefs.getString(Globals.KEY_API_TOKEN),
            HttpHeaders.acceptHeader: 'application/json',
          },
        )
    );
  }


  /// register
  Future<dynamic> register(LoginForm loginForm) async {
    var url = Globals.BASE_URL + 'register';
    Dio dio = new Dio();
    return await dio.post(url, data: loginForm,
        options: Options(
          headers: <String, String>{
            HttpHeaders.acceptHeader: 'application/json',
          },
        )
    );
  }

}