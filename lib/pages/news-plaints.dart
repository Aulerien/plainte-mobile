import 'package:flutter/material.dart';

class NewsPlaintsPage extends StatefulWidget {
  NewsPlaintsPage({Key key}): super(key: key);

  final String title = "Actualité";

  @override
  _NewsPlaintsPageState createState() => _NewsPlaintsPageState();
}

class _NewsPlaintsPageState extends State<NewsPlaintsPage> {

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
