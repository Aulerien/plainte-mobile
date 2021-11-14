import 'package:flutter/material.dart';

class MyPlaintsPage extends StatefulWidget {
  MyPlaintsPage({Key key}): super(key: key);

  final String title = "Mes plaintes";

  @override
  _MyPlaintsPageState createState() => _MyPlaintsPageState();
}

class _MyPlaintsPageState extends State<MyPlaintsPage> {

  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: buildHowItWorksItems()
    );
  }

  List<Widget> buildHowItWorksItems() {
    return [
      // 1
      buildStep1(),
      SizedBox(height: 10,),
      lineSeparator(),
    ];
  }

  Widget lineSeparator() {
    return SizedBox(height: 2,
      child: Container(
        color: Colors.blueGrey,
    ),);
  }

  Column buildNumberItem(IconData icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.purple,
          size: 100,
        )
      ],
    );
  }

  /// step 1
  Widget buildStep1() {
    Text text = Text(
      "Etape 1 : Inscrivez vous pour Inscrivez vous pour  Inscrivez vous pour "
          "Inscrivez vous pour Inscrivez vous pour  Inscrivez vous pour "
          "Inscrivez vous pour Inscrivez vous pour  Inscrivez vous pour "
          "Inscrivez vous pour Inscrivez vous pour  Inscrivez vous pour "
          "Inscrivez vous pour Inscrivez vous pour  Inscrivez vous pour ",
    );
    return buildStep(Icons.looks_one, text);
  }

  /// step 2
  Widget buildStep2() {
    Text text = Text(
      "Etape 2 : pascal findouno pascal findouno pascal findouno"
          " pascal findouno pascal findouno pascal findouno pascal findouno"
          " pascal findouno pascal findouno pascal findouno pascal findouno"
          " pascal findouno pascal findouno pascal findouno pascal findouno"
          " pascal findouno pascal findouno pascal findouno pascal findouno",
    );
    return buildStep(Icons.looks_two, text);
  }

  /// step 3
  Widget buildStep3() {
    Text text = Text(
      "Etape 3 : berbatov dimitar berbatov dimitar berbatov dimitar berbatov dimitar"
          " berbatov dimitar berbatov dimitar berbatov dimitar berbatov dimitar"
          " berbatov dimitar berbatov dimitar berbatov dimitar berbatov dimitar"
          " berbatov dimitar berbatov dimitar berbatov dimitar berbatov dimitar"
          " berbatov dimitar berbatov dimitar berbatov dimitar berbatov dimitar",
    );
    return buildStep(Icons.looks_3, text);
  }



  /// build a step
  Widget buildStep(IconData icon ,Text text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildNumberItem(icon),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: text
              )
            ],
          ),
        ),
      ],
    );
  }

}
