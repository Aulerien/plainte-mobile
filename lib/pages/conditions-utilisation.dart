import 'package:flutter/material.dart';

class ConditionUtilisationPage extends StatefulWidget {
  ConditionUtilisationPage({Key key}): super(key: key);

  final String title = "Plainte";

  @override
  _ConditionUtilisationPageState createState() => _ConditionUtilisationPageState();
}

class _ConditionUtilisationPageState extends State<ConditionUtilisationPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
             style: TextStyle(
                  color: Colors.white
              )
          ),
        )
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Bienvenue dans l'application qui va vous permettre de vous exprimer librement",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ConditionUtilisationPage()
                  )
                )
              },
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    )
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Text("J'accepte les conditions générales d'utilisation",
                    style: TextStyle(
                        color: Colors.white
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ) ,
            )
          ],
        ),
      )
    );
  }
}
