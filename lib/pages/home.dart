import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:plainte/pages/my-drawer.dart';
import 'package:plainte/pages/my-plaints.dart';
import 'package:plainte/pages/news-plaints.dart';
import 'package:plainte/pages/plaints-closed.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class HomePage extends StatefulWidget {
  int defaultSection = 0;
  HomePage({
    this.defaultSection,
    Key key,

  }):super(key:key);
  HomePageState createState() =>  HomePageState();
}

class  HomePageState extends State<HomePage> with TickerProviderStateMixin {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  SharedPreferences prefs;
  AnimationController _controller;
  Animation<double> _animation;
  int _currentIndex = 0;
  int _selectedIndex = 0;

  @override
  void initState()   {
    super.initState();
    _currentIndex = widget.defaultSection;

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,

    )..repeat(reverse:true);
    _animation = CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn
    );


  }

  void _onItemTapped(int index) {
    setState(() {
      switch(index){
        case 0:
          _currentIndex = index;
          break;
        case 1:
          _currentIndex = index;
          break;
        case 2:
          _currentIndex = index;
          break;
        case 3:
          _currentIndex = index;
          break;

      }
    });
  }
  void loadRadio() async {

  }





  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }




  @override
  Widget build(BuildContext context) {
    List<Widget> _children = [
      buildHomeSection(), // statistique
      buildNewsPlaintsSection(), // news-plaint section
      buildPlaintsClosedSection(), // plaints-closed
      buildMyPlaintsSection(), // my-plainte
    ];
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(
          'Plainte',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        animationDuration: Duration(milliseconds: 350),
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: _onItemTapped,
        items: buildBottomNavigation(),
      ),
    );
  }

  /// my plaints
  buildMyPlaintsSection() {
    return MyPlaintsPage();
  }

  /// news plaints
  buildNewsPlaintsSection() {
    return NewsPlaintsPage();
  }

  /// plaints closed
  buildPlaintsClosedSection() {
    return PlaintsClosedPage();
  }

  /// home section
  buildHomeSection() {
    return Text("home home home home home home home home home home home home home home home home home home");
  }

  List<BottomNavyBarItem> buildBottomNavigation() {
    return [
     buildNagivationItem("Statistiques", Icon(Icons.show_chart)),
     buildNagivationItem("Actualités", Icon(Icons.topic)),
     buildNagivationItem("Traitées", Icon(Icons.done_all)),
     buildNagivationItem("Mes plaintes", Icon(Icons.person)),
    ];
  }

  /// build  navigation-item
  BottomNavyBarItem buildNagivationItem(String title, Widget icon) {
    return BottomNavyBarItem(
        icon: icon,
        title: Text(title,
          style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
        activeColor: Colors.purple,
        inactiveColor: Colors.grey,
        textAlign: TextAlign.center
    );
  }

}

