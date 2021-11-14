import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plainte/form-validators/ext-string.dart';
import 'package:plainte/pages/home.dart';
import 'dart:ui';

import 'package:plainte/utils/constantes.dart';

class LoginPage extends StatefulWidget {

  final String title = "Connexion";
  LoginPage({
    Key key,
  }):super(key:key);
  LoginPageState createState() => LoginPageState();
}

class  LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool obscureText = true;
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  TextEditingController textEditingControllerEmail = new TextEditingController();
  TextEditingController textEditingControllerPassword = new TextEditingController();


  @override
  void initState()  {

    // TODO: implement initState
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

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
        key: _scaffoldKey,
        body:
        Form(
          key: _formKey,
          child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    SizedBox(height: 30),
                    Icon(
                      Icons.lock,
                      size: 150,
                    ),
                    SizedBox(height: 20),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[

                      ],
                    ),
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                            controller: textEditingControllerEmail,
                            validator: (value) {
                              return value.isValidEmail ? null : "Veuillez entrer une addresse mail valide";
                            },
                            onSaved: (value) => _email = value.trim(),
                            decoration: Constantes.myInputDecoration("Adresse email")
                        )


                    ),
                    SizedBox(height: 24),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child:
                      TextFormField(
                          key: new Key('_password'),
                          controller: textEditingControllerPassword,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            return value.isValidPassword ? null : "Le mot de passe doit contenir au moins "
                                "8 caractères dont au moins 1 majuscule, 1 minuscule, 1 chiffre, 1 caractère spécial.";
                          },
                          onSaved: (value) => _email = value.trim(),
                          obscureText: obscureText,
                          decoration: InputDecoration(
                              suffixIcon:IconButton(
                                iconSize: 30,
                                icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
                                onPressed:  () => setState(() => obscureText = !obscureText),
                              ),
                              labelText: "Mot de passe",
                              enabledBorder: Constantes.myEnabledBorder(),
                              focusedBorder: Constantes.myFocusedBorder(),
                              errorBorder: Constantes.myErrorBorder(),
                              focusedErrorBorder: Constantes.myFocusedErrorBorder(),
                              errorMaxLines: 10
                          )
                      ),
                    ),
                    SizedBox(height: 24),

                    InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()
                            ));
                      },
                      child: Text(
                        "Je n'ai pas encore créé de compte",
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                    ),
                    SizedBox(height: 50),
                    TextButton(
                        onPressed: () {
                          login();
                        },
                        child: Container(
                        margin: EdgeInsets.only(left: 60, right: 60),
                        decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            )
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Connexion",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17
                                ),
                                textAlign: TextAlign.justify,
                              ),
                              Icon(Icons.navigate_next, size: 25, color: Colors.white,)
                            ],
                          ),
                        ),
                      )
                    )
                  ],
                )
              ]
          ),
        )
    );
  }


  login() {
      if (_formKey.currentState.validate()) {
        /// send api request to login
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(defaultSection: 0,)
            ));
      } else {
        final snackBar = SnackBar(
          content: const Text("Formulaire invalide"),
          backgroundColor: Colors.blueGrey,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
  }


}

