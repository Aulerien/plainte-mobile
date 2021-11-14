import 'package:flutter/material.dart';
import 'package:plainte/pages/conditions-utilisation.dart';
import 'package:plainte/pages/login.dart';

class HowItWorksPage extends StatefulWidget {
  HowItWorksPage({Key key}): super(key: key);

  final String title = "Comment ça marche ?";

  @override
  _HowItWorksPageState createState() => _HowItWorksPageState();
}

class _HowItWorksPageState extends State<HowItWorksPage> {

  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.title,
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.white
            )
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: buildHowItWorksItems(),
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.only(bottom: 10, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage()
                      )
                  )
              },
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    )
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 50, right: 50, top: 15, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Démarrer",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Icon(Icons.navigate_next, size: 25, color: Colors.white,)
                    ],
                  ),
                ),
              ) ,
            )
          ],
        ),
      )
    );
  }

  List<Widget> buildHowItWorksItems() {
    return [
      // 1
      buildStep1(),
      SizedBox(height: 10,),
      lineSeparator(),
      // 2
      buildStep2(),
      SizedBox(height: 10,),
      lineSeparator(),
      // 3
      buildStep3(),
      SizedBox(height: 10,),
      lineSeparator(),
      // 4
      buildStep4(),
      SizedBox(height: 10,),
      lineSeparator(),
      // 5
      buildStep5(),
      SizedBox(height: 10,),
      lineSeparator(),
      // 6
      buildStep6(),
      SizedBox(height: 100,),
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

  /// step 4
  Widget buildStep4() {
    Text text = Text(
      "Etape 4 : bolo bolo  bolo bolo bolo bolo bolo bolo bolo bolo bolo bolo "
          " bolo bolo bolo bolo bolo bolo bolo bolo bolo bolo bolo bolo bolo bolo "
          " bolo bolo bolo bolo bolo bolo bolo bolo bolo bolo bolo bolo bolo bolo "
          " bolo bolo bolo bolo bolo bolo bolo bolo bolo bolo bolo bolo bolo bolo "
          " bolo bolo bolo bolo bolo bolo bolo bolo bolo bolo bolo bolo bolo bolo "
    );
    return buildStep(Icons.looks_4, text);
  }

  /// step 5
  Widget buildStep5() {
    Text text = Text(
      "Etape 5 : data data  data data data data data data data data data data data data"
          " data data data data data data data data data data data data data data"
          " data data data data data data data data data data data data data data"
          " data data data data data data data data data data data data data data"
          " data data data data data data data data data data data data data data",
    );
    return buildStep(Icons.looks_5, text);
  }


  /// step 6
  Widget buildStep6() {
    Text text = Text(
      "Etape 6 : text text text text text text text text text text text text "
          " text text text text text text text text text text text text text text "
          " text text text text text text text text text text text text text text "
          " text text text text text text text text text text text text text text "
          " text text text text text text text text text text text text text text "
          " text text text text text text text text text text text text text text "
          " text text text text text text text text text text text text text text "
          " text text text text text text text text text text text text text text "
          " text text text text text text text text text text text text text text "
          " text text text text text text text text text text text text text text "
    );
    return buildStep(Icons.looks_6, text);
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
