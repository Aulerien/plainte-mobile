import 'dart:io';

import 'package:flutter/material.dart';
import 'package:plainte/pages/home.dart';
import 'package:plainte/utils/constantes.dart';
import 'package:plainte/form-validators/ext-string.dart';
import 'package:file_picker/file_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class SavePlaintPage extends StatefulWidget {
  SavePlaintPage({Key key}): super(key: key);

  final String title = "Création d'une plainte";

  @override
  _SavePlaintPageState createState() => _SavePlaintPageState();
}

class _SavePlaintPageState extends State<SavePlaintPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool obscureText = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController textEditingControllerDescription = new TextEditingController();
  TextEditingController textEditingControllerLieu = new TextEditingController();
  PlatformFile fileSelected;
  TextEditingController controllerFileChooser = TextEditingController();
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController?.dispose();
    chewieController?.dispose();
  }

  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                SizedBox(height: 30),
                Icon(
                  Icons.spa,
                  size: 80,
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
                    child: TextFormField(
                        controller: textEditingControllerLieu,
                        validator: (value) {
                          return value.isNotNull ? null : "Veuillez saisir le lieu";
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
                          return value.isNotNull ? null : "Veuillez entrer la description";
                        },
                        decoration: Constantes.myInputDecoration("Description de ce qui s'est passé")
                    )
                ),

                // photo / image chooser
                buildImageOrVideoChooser(),

                // show file illustration
                buildFileIllustration(),

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




  register() {
    if (_formKey.currentState.validate()) {
      String description = textEditingControllerDescription.text;

      /// send api request to register
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

  void openFileChooser(bool isPhoto) async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      //type: FileType.custom
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
        margin: EdgeInsets.only(left: 10, right: 10),
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
