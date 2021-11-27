import 'package:flutter/material.dart';
import 'package:plainte/pages/login.dart';
import 'package:plainte/services/user.service.dart';
class MyDrawer extends StatelessWidget {
  MyDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child:
        Container(color: Colors.black12.withOpacity(.6),
          child:
          ListView(
            children: [
              DrawerHeader(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Plainte',
                    style: TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),),
                  ],
                ),
              ),
              ListTile(
                leading: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Icon(Icons.show_chart, color: Colors.white,),
                ),
                title: const Text(
                  'Statistique', style: TextStyle(color: Colors.white),),
                onTap: () {

                },
              ),
              ListTile(
                leading: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Icon(Icons.topic, color: Colors.white,),
                ),

                title: const Text(
                  'Actualités', style: TextStyle(color: Colors.white),),
                onTap: () {

                },
              ),
              ListTile(
                leading: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Icon(Icons.add, color: Colors.white,),
                ),

                title: const Text(
                  'Créer une plainte', style: TextStyle(color: Colors.white),),
                onTap: () {

                },
              ),
              ListTile(
                leading: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Icon(Icons.done_all, color: Colors.white,),
                ),

                title: const Text(
                  'Plaintes traitées', style: TextStyle(color: Colors.white),),
                onTap: () {

                },
              ),
              ListTile(
                leading: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Icon(Icons.person, color: Colors.white,),
                ),

                title: const Text(
                  'Mes plaintes', style: TextStyle(color: Colors.white),),
                onTap: () {

                },
              ),

              ListTile(
                leading: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Icon(Icons.help, color: Colors.white,),
                ),


                title: const Text(
                  'Comment ça marche ?', style: TextStyle(color: Colors.white),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              ListTile(
                  leading: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Icon(Icons.power_settings_new, color: Colors.white,),
                  ),

                  title: const Text(
                    'Déconnexion', style: TextStyle(color: Colors.white),),
                  onTap: () async {
                    await UserService.logout();
                // navigate to home
                Navigator.pushAndRemoveUntil(
                context, MaterialPageRoute(
                  builder: (BuildContext context) => LoginPage()
              ), (route) => false,
              );
                  }
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Text('Version 1.0.0',
                style: TextStyle(
                  color: Colors.white,
                ),),
              ),
            ],
          ),
        )
    );
  }

}
