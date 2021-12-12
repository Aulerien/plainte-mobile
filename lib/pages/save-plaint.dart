import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:plainte/forms/save-plaint-form.dart';
import 'package:plainte/models/category-plaint.dart';
import 'package:plainte/models/etat-plaint.dart';
import 'package:plainte/models/user.dart';
import 'package:plainte/pages/home.dart';
import 'package:plainte/services/categorie-plaint.service.dart';
import 'package:plainte/services/etat-plaint.service.dart';
import 'package:plainte/services/plaint.service.dart';
import 'package:plainte/utils/constantes.dart';
import 'package:plainte/form-validators/ext-string.dart';
import 'package:file_picker/file_picker.dart';
import 'package:plainte/utils/globals.dart';
import 'package:plainte/utils/toast.service.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:loader_overlay/loader_overlay.dart';

class SavePlaintPage extends StatefulWidget {
  SavePlaintPage({Key key}): super(key: key);

  final String title = "Création d'une plainte";

  @override
  _SavePlaintPageState createState() => _SavePlaintPageState();
}

class _SavePlaintPageState extends State<SavePlaintPage> {
  List<CategoryPlaint> categories = [];
  CategoryPlaint categoryPlaintSelected;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool obscureText = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController textEditingControllerDescription = new TextEditingController();
  TextEditingController textEditingControllerLieu = new TextEditingController();
  PlatformFile fileSelected;
  TextEditingController controllerFileChooser = TextEditingController();
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;
  User user = User.fromJson(json.decode(Globals.prefs.getString(Globals.KEY_USER_AUTH)));
  EtatPlaint defaultEtatPlaint;

  @override
  void initState()  {
    bindData();
    super.initState();
  }

  bindData() async {
    var response = await CategoriePlaintService.list();
    //await EtatPlaintService.save();
    var responseEtat = await EtatPlaintService.list();
    if(responseEtat.statusCode == 200) {
      Iterable iterable = json.decode(responseEtat.body)["etatplaintes"];
      if(iterable.length > 0) {
        defaultEtatPlaint = EtatPlaint.fromJson(iterable.first);
      }
    }
    print('Etat');
    print(responseEtat.body);
    print(response.statusCode);
    if(response.statusCode == 200) {
      print(response.body);
      List list = json.decode(response.body)['categories'];
      categories =  List<CategoryPlaint>.from(list.map( (e) => CategoryPlaint.fromJson(e)));
      if(categories.length > 0) {
        setState( () {
          categoryPlaintSelected = categories[0];
        });
      }
      print(categories);
    }
  }

  @override
  void dispose() {
    videoPlayerController?.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                SizedBox(height: 15),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    // EdgeInsets.only(left: 20, right: 20),
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          "Racontez au public ce qui s'est passé ...",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // lieu
                SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                  ),
                  margin: EdgeInsets.only(left: 20, right: 20),
                  height: 60,
                  child: FormField<CategoryPlaint>(
                    builder: (FormFieldState<CategoryPlaint> state) {
                      return InputDecorator(
                        decoration:
                        InputDecoration(
                          labelStyle: TextStyle(fontSize: 16),
                          errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                          hintText: 'Choisissez une catégorie',
                          labelText: "Catégorie",
                          enabledBorder: Constantes.myEnabledBorder(),
                          focusedBorder: Constantes.myFocusedBorder(),
                          errorBorder: Constantes.myErrorBorder(),
                          focusedErrorBorder: Constantes.myFocusedErrorBorder(),
                        ),
                        isEmpty: null == '',
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<CategoryPlaint>(
                            value: categoryPlaintSelected,
                            isDense: true,
                            onChanged: (CategoryPlaint newValue) {
                              setState(() {
                                state.didChange(newValue);
                                categoryPlaintSelected = newValue;
                              });
                            },
                            items: categories.map((CategoryPlaint categoryPlaint) {
                              return DropdownMenuItem<CategoryPlaint>(
                                value: categoryPlaint,
                                child: Text(categoryPlaint.libelle),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 15),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                    ),
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                        controller: textEditingControllerLieu,
                        validator: (value) {
                          return (value.isNotNull && value.trim().length > 0) ?  null : "Veuillez saisir le lieu";
                        },
                        decoration: Constantes.myInputDecoration("Lieu")
                    )
                ),

                // description
                SizedBox(height: 15),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                    ),
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                        controller: textEditingControllerDescription,
                        minLines: 5,
                        maxLines: 20,
                        validator: (value) {
                          return (value.isNotNull && value.trim().length > 0) ?  null : "Veuillez entrer la description";
                        },
                        decoration: Constantes.myInputDecoration("Description de ce qui s'est passé")
                    )
                ),

                // show file illustration
                buildFileIllustration(),

                // photo / image chooser
                buildImageOrVideoChooser(),

                TextButton(
                    onPressed: () {
                      savePlaint(context);
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
                            Text("Publier",
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
    );
  }



  /// save plaint
  savePlaint(BuildContext context) async {
    if(defaultEtatPlaint == null) {
      ToastService.displayMessage(context, "Etat plaint non disponible");
      return;
    }
    if(categoryPlaintSelected == null) {
      ToastService.displayMessage(context, "Veuillez sélectionner une catégorie");
      return;
    }
    if (_formKey.currentState.validate()) {
      context.loaderOverlay.show();
      await Future.delayed(Duration(seconds: 1));
      String description = textEditingControllerDescription.text;
      String lieu = textEditingControllerLieu.text;
      SavePlaintForm savePlaintForm = SavePlaintForm();
      savePlaintForm.fileSelected = fileSelected;
      savePlaintForm.localisation = lieu;
      savePlaintForm.description = description;
      savePlaintForm.categoryPlaint = categoryPlaintSelected;
      savePlaintForm.etatPlaint = defaultEtatPlaint;
      savePlaintForm.user = user;

      /// save plaint
      try {
        var response = await  PlaintService.savePlaint(savePlaintForm);
        print(response.data);
        if(response.statusCode == 200) {
          context.loaderOverlay.hide();
          ToastService.displayMessage(context, "Votre plainte est crée avec succès. Merci");
          // navigate to home
          Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(
              builder: (BuildContext context) => HomePage(defaultSection: 1,)
          ), (route) => false,
          );
        } else {
          ToastService.displayMessage(context, "Une erreur est survenue lors de l'enregistrement. Veuillez réessayer.");
        }
        context.loaderOverlay.hide();
      } on DioError catch (e) {
        print('type error ' + e.type.toString());
        print('message : ' + e.response.toString());
        ToastService.displayMessage(context, "Une erreur est survenue lors de l'enregistrement. Veuillez réessayer.");
        context.loaderOverlay.hide();
      }
    } else {
      final snackBar = SnackBar(
        content: const Text("Formulaire invalide"),
        backgroundColor: Colors.blueGrey,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void openFileChooser(bool isPhoto) async {
    FileType fileType = FileType.image;
    if(!isPhoto) {
      fileType = FileType.video;
    }
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: fileType
    );
    if (result != null) {
      // Uint8List fileBytes = result.files.first.bytes;
      // String fileName = result.files.first.name;
      setState( () {
        fileSelected = result.files.first;
        controllerFileChooser.text = fileSelected.name;
      });
    }
  }

  Widget buildFileIllustration() {
    if(fileSelected == null) return Container();

    // IMAGE
    var imagesExtensions = ['jpeg', 'png', 'jpg'];
    print('File extension ' + fileSelected.extension.toString().toLowerCase());
    if(imagesExtensions.contains(fileSelected.extension.toString().toLowerCase())) {
      return Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Image.file(
          new File(fileSelected.path),
          fit: BoxFit.fill,
        ),
      );
    }
    // VIDEO
    videoPlayerController = VideoPlayerController.file(
      new File(fileSelected.path),

    );
    /*await videoPlayerController.initialize();*/
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 5/8,
      autoInitialize: true,
      autoPlay: false,
      looping: false,
    );
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        height: 400,
        child: Chewie(controller: chewieController,)
    );
  }


  /// build image or video chooser
  Widget buildImageOrVideoChooser() {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //photo
          InkWell(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.photo, size: 70,),
                Text('Joindre une photo'),
              ],
            ),
            onTap: () {
              openFileChooser(true);
            },
          ),

          // video
          InkWell(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.radio, size: 70,),
                Text('Joindre une vidéo'),
              ],
            ),
            onTap: () {
              openFileChooser(false);
            },
          ),
        ],
      ),
    );
  }



}
