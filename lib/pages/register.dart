import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plainte/form-validators/ext-string.dart';
import 'package:plainte/forms/register-form.dart';
import 'package:plainte/models/user.dart';
import 'package:plainte/pages/home.dart';
import 'package:plainte/pages/login.dart';
import 'package:plainte/services/user.service.dart';
import 'dart:ui';

import 'package:plainte/utils/constantes.dart';
import 'package:plainte/utils/globals.dart';
import 'package:plainte/utils/toast.service.dart';

class RegisterPage extends StatefulWidget {

  final String title = "Création de compte";
  RegisterPage({
    Key key,
  }):super(key:key);
  RegisterPageState createState() => RegisterPageState();
}

class  RegisterPageState extends State<RegisterPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool obscureText = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController textEditingControllerNom = new TextEditingController();
  TextEditingController textEditingControllerPrenom = new TextEditingController();
  TextEditingController textEditingControllerEmail = new TextEditingController();
  TextEditingController textEditingControllerTelephone = new TextEditingController();
  TextEditingController textEditingControllerPassword = new TextEditingController();
  TextEditingController textEditingControllerConfirmPassword = new TextEditingController();
  int sexValue = 1;


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
                      Icons.person_add,
                      size: 120,
                    ),
                    SizedBox(height: 15),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        // EdgeInsets.only(left: 20, right: 20),
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "Inscrivez-vous pour commencer par vous exprimer",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // nom
                    SizedBox(height: 15),
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                            controller: textEditingControllerNom,
                            validator: (value) {
                              return value.isNotNull ? null : "Veuillez entrer votre nom";
                            },
                            decoration: Constantes.myInputDecoration("Nom")
                        )
                    ),
                    // prenom
                    SizedBox(height: 15),
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                            controller: textEditingControllerPrenom,
                            validator: (value) {
                              return value.isNotNull ? null : "Veuillez entrer votre prénom";
                            },
                            decoration: Constantes.myInputDecoration("Prénom(s)")
                        )
                    ),
                    // sexe
                    SizedBox(height: 15),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        // EdgeInsets.only(left: 20, right: 20),
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Sexe', textAlign: TextAlign.start,
                             style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    buildSexeRadios(),
                    // telephone
                    SizedBox(height: 15),
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: textEditingControllerTelephone,
                            validator: (value) {
                              return value.isValidPhone ? null : "Veuillez entrer votre numéro de téléphone";
                            },
                            decoration: Constantes.myInputDecoration("Téléphone")
                        )
                    ),
                    // email
                    SizedBox(height: 15),
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
                            decoration: Constantes.myInputDecoration("Adresse email")
                        )
                    ),
                    // mot de passe
                    SizedBox(height: 15),
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


                    SizedBox(height: 15),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child:
                      TextFormField(
                          key: new Key('_confirmPassword'),
                          controller: textEditingControllerConfirmPassword,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            return textEditingControllerConfirmPassword.text == textEditingControllerPassword.text ? null : "Les mot de passe ne sont pas identiques";
                          },
                          obscureText: obscureText,
                          decoration: InputDecoration(
                              suffixIcon:IconButton(
                                iconSize: 30,
                                icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
                                onPressed:  () => setState(() => obscureText = !obscureText),
                              ),
                              labelText: "Confirmation du mot de passe",
                              enabledBorder: Constantes.myEnabledBorder(),
                              focusedBorder: Constantes.myFocusedBorder(),
                              errorBorder: Constantes.myErrorBorder(),
                              focusedErrorBorder: Constantes.myFocusedErrorBorder(),
                              errorMaxLines: 10
                          )
                      ),
                    ),

                    SizedBox(height: 20),

                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                     },
                      child: Text(
                        "J'ai déjà un compte",
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                    ),
                    SizedBox(height: 20),
                    TextButton(
                        onPressed: () {
                          register();
                        },
                        child: Container(
                        margin: EdgeInsets.only(left: 60, right: 60, bottom: 20),
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
                              Text("S'inscrire",
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



  /// build radio item
  Container buildItemRadio(String title, int radioValue) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // maculin
          Radio(
            value: radioValue,
            groupValue: sexValue,
            onChanged: (value) {
              setState( () {
                sexValue = value;
              });
            },
          ),
          InkWell(
            child: Text(title),
            onTap: () {
              setState( () {
                sexValue = radioValue;
              });
            },
          ),
        ],
      ),
    );
  }

  /// sexes
  Column buildSexeRadios() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        buildItemRadio('Masculin', 1),
        buildItemRadio('Féminin', 2),
        buildItemRadio('Autre', 3),
      ],
    );
  }


  register() async {
      if (_formKey.currentState.validate()) {
        String nom = textEditingControllerNom.text;
        String prenom = textEditingControllerPrenom.text;
        String email = textEditingControllerEmail.text;
        String telephone = textEditingControllerTelephone.text;
        String password = textEditingControllerPassword.text;
        String sexe = "";
        switch(sexValue) {
          case 1 :
            sexe = "MASCULIN";
            break;
          case 2 :
            sexe = "FEMININ";
            break;
          default :
            sexe = "AUTRE";
            break;
        }
        RegisterForm registerForm = new RegisterForm();
        registerForm.password = password;
        registerForm.email = email;
        registerForm.phone = telephone;
        registerForm.fullname = nom + " " + prenom;
        // save user

          var response =  await UserService.register(registerForm);
          if(response.statusCode == 409) {
            ToastService.displayMessage(context, "Ce compte utilisateur existe déjà. Veuillez vous connecter");
            return;
          }
          if(response.statusCode == 200) {
            User newUser = User.fromJson(json.decode(response.body));
            await Globals.prefs.setString(Globals.KEY_USER_AUTH, newUser.toJson().toString());

            Navigator.of(context).pushNamed(Globals.ROUTE_LOGIN, arguments: {
              'defaultLogin' : newUser.email
            });
            return;
          }
      } else {
        ToastService.displayMessage(context, "Formulaire invalide");
      }
  }


}

