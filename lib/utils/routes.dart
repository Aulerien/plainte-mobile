import 'package:flutter/material.dart';
import 'package:plainte/pages/conditions-utilisation.dart';
import 'package:plainte/pages/home.dart';
import 'package:plainte/pages/how-it-works.dart';
import 'package:plainte/pages/login.dart';
import 'package:plainte/pages/register.dart';
import 'package:plainte/pages/welcome.dart';
import 'package:plainte/utils/globals.dart';

/// routes pages
var routesApplication = <String, WidgetBuilder> {
  Globals.ROUTE_LOGIN: (context) => LoginPage(),
  Globals.ROUTE_WELCOME: (context) => WelcomePage(),
  Globals.ROUTE_HOW_IT_WORKS: (context) => HowItWorksPage(),
  Globals.ROUTE_CONDITIONS_UTILISATION: (context) => ConditionUtilisationPage(),
  Globals.ROUTE_HOME: (context) => HomePage(),
  Globals.ROUTE_REGISTER: (context) => RegisterPage(),
};