import 'package:shared_preferences/shared_preferences.dart';

/// constants globals file
class Globals {

  static SharedPreferences prefs = null;
  // base url
  static final String BASE_URL = "https://api-plaintes.herokuapp.com/api";

  static final String KEY_API_TOKEN = "KEY_API_TOKEN";
  static final String KEY_USER_AUTH = "KEY_USER_AUTH";
  static final String KEY_APP_INITIALIZED = "KEY_APP_INITIALIZED";


  // routes names
  static final String ROUTE_LOGIN = "/login";
  static final String ROUTE_WELCOME = "/welcome";
  static final String ROUTE_HOW_IT_WORKS = "/how-it-works";
  static final String ROUTE_CONDITIONS_UTILISATION = "/conditions-utilisations";
  static final String ROUTE_HOME = "/home";
  static final String ROUTE_REGISTER = "/register";

}