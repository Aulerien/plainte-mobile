import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:plainte/forms/login-form.dart';
import 'package:plainte/forms/register-form.dart';
import 'package:plainte/models/plaint.dart';
import 'package:plainte/utils/globals.dart';
class UserService {

  /// login
  static Future<dynamic> login(LoginForm loginForm) async {
    var url = Globals.BASE_URL + '/admins/login';
    return await http.post(Uri.parse(url), headers: <String, String>{
      HttpHeaders.acceptHeader: 'application/json',
    }, body: json.encode(loginForm));
  }


  /// register
  static Future<dynamic> register(RegisterForm registerForm) async {
    registerForm.role = "usager";
    var url = Globals.BASE_URL + '/admins/register';
    return await http.post(Uri.parse(url), headers: <String, String>{
      HttpHeaders.acceptHeader: 'application/json',
    }, body: json.encode(registerForm));
  }


  /// logout
  static Future<dynamic> logout() async {
    await Globals.prefs.remove(Globals.KEY_API_TOKEN);
    await Globals.prefs.remove(Globals.KEY_USER_AUTH);
  }

}