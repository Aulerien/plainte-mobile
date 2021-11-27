import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plainte/pages/home.dart';
import 'package:plainte/pages/how-it-works.dart';
import 'package:plainte/pages/login.dart';
import 'package:plainte/pages/welcome.dart';
import 'package:plainte/utils/globals.dart';
import 'package:plainte/utils/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp] // mode portrait
  );
  // preference instance
  Globals.prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Widget defaultHomePage = WelcomePage();
    String token = Globals.prefs.getString(Globals.KEY_API_TOKEN);
    if(token != null && !token.isEmpty) {
      defaultHomePage = HomePage(defaultSection: 1,);
    } else {
      bool apkInitialzed = Globals.prefs.getBool(Globals.KEY_APP_INITIALIZED);
      if(apkInitialzed == true) {
        defaultHomePage = LoginPage();
      }
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plainte',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: defaultHomePage,
      routes: routesApplication,
    );
  }
}