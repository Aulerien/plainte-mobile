import 'package:shared_preferences/shared_preferences.dart';

/// constants globals file
class Globals {

  static SharedPreferences prefs = null;
  // base url
  static final String BASE_URL = "https://api-plaintes.herokuapp.com/api/";

  static final String KEY_API_TOKEN = "KEY_API_TOKEN";

}