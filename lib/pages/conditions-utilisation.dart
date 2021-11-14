import 'package:flutter/material.dart';
import 'package:plainte/pages/how-it-works.dart';

class ConditionUtilisationPage extends StatefulWidget {
  ConditionUtilisationPage({Key key}): super(key: key);

  final String title = "Conditions générales d'utilisation";

  @override
  _ConditionUtilisationPageState createState() => _ConditionUtilisationPageState();
}

class _ConditionUtilisationPageState extends State<ConditionUtilisationPage> {

  ScrollController scrollController = ScrollController();
  bool canGoToNext = false;

  @override
  void initState() {
    scrollController.addListener( () {
      if(scrollController.position.atEdge) {
        if(scrollController.position.pixels == 0) {
          // at the top
          setState( () {
            canGoToNext = false;
          });
          print('at the top');
        } else {
          // bottom
          setState( () {
            canGoToNext = true;
          });
          print('at the bottom');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
            widget.title,
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.white
            )
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 100, left: 15, right: 15),
              child: Text(
                "Lorem ipsum dolor sit amet consectetur adipisicing elit. "
                    "Maxime mollitia,molestiae quas vel sint commodi repudiandae "
                    "consequuntur voluptatum laborumnumquam blanditiis harum quisquam "
                    "eius sed odit fugiat iusto fuga praesentiumoptio, eaque rerum! "
                    "Provident similique accusantium nemo autem. Veritatisobcaecati "
                    "Provident similique accusantium nemo autem. Veritatisobcaecati "
                    "Provident similique accusantium nemo autem. Veritatisobcaecati "
                    "Provident similique accusantium nemo autem. Veritatisobcaecati "
                    "Provident similique accusantium nemo autem. Veritatisobcaecati "
                    "Provident similique accusantium nemo autem. Veritatisobcaecati "
                    "Provident similique accusantium nemo autem. Veritatisobcaecati "
                    "Provident similique accusantium nemo autem. Veritatisobcaecati "
                    "Provident similique accusantium nemo autem. Veritatisobcaecati "
                    "tenetur iure eius earum ut molestias architecto voluptate aliquamnihil,"
                    " eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit,tenetur"
                    " error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,quia. Quo neque"
                    " error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,quia. Quo neque"
                    " error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,quia. Quo neque"
                    " error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,quia. Quo neque"
                    " error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,quia. Quo neque"
                    " error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,quia. Quo neque"
                    " error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,quia. Quo neque"
                    " error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,quia. Quo neque"
                    " error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,quia. Quo neque"
                    " error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,quia. Quo neque"
                    " error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,quia. Quo neque"
                    " error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,quia. Quo neque"
                    " error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,quia. Quo neque"
                    " error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,quia. Quo neque"
                    " error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,quia. Quo neque"
                    " error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,quia. Quo neque"
                    " error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,quia. Quo neque"
                    " error repudiandae fuga? Ipsa laudantium molestias eossapiente officiis modi at "
                    "sunt excepturi expedita sint? Sed quibusdamrecusandae alias error harum maxime "
                    "adipisci amet laborum. Perspiciatisminima nesciunt dolorem! Officiis iure rerum "
                    "voluptates a cumque veli quibusdam sed amet tempora. Sit laborum ab, eius fugit "
                    "doloribus teneturfugiat, temporibus enim commodi iusto libero magni deleniti"
                    " quod quamconsequuntur! Commodi minima excepturi repudiandae velit hic maxime "
                    "doloremque. Quaerat provident commodi consectetur veniam similique adearum omnis"
                    "doloremque. Quaerat provident commodi consectetur veniam similique adearum omnis"
                    "doloremque. Quaerat provident commodi consectetur veniam similique adearum omnis"
                    "doloremque. Quaerat provident commodi consectetur veniam similique adearum omnis"
                    "doloremque. Quaerat provident commodi consectetur veniam similique adearum omnis"
                    "doloremque. Quaerat provident commodi consectetur veniam similique adearum omnis"
                    "doloremque. Quaerat provident commodi consectetur veniam similique adearum omnis"
                    "doloremque. Quaerat provident commodi consectetur veniam similique adearum omnis"
                    "doloremque. Quaerat provident commodi consectetur veniam similique adearum omnis"
                    "doloremque. Quaerat provident commodi consectetur veniam similique adearum omnis"
                    "doloremque. Quaerat provident commodi consectetur veniam similique adearum omnis"
                    " ipsum saepe, voluptas, hic voluptates pariatur est explicab fugiat, dolorum "
                    "eligendi quam cupiditate excepturi mollitia maiores laboresuscipit quas? Nulla,"
                    " placeat. Voluptatem quaerat non architecto ab laudantiummodi minima sunt esse "
                    "temporibus sint culpa, recusandae aliquam numquamtotam ratione voluptas quod"
                    " exercitationem fuga. Possimus quis earum veniam"
                    "quasi aliquam eligendi, placeat qui corporis",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ) ,
      bottomSheet: Padding(
        padding: EdgeInsets.only(bottom: 10, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => {
                if(canGoToNext) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HowItWorksPage()
                      )
                  )
                }
              },
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    color: Colors.purple.withOpacity(canGoToNext ? 1 : .3),
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
                    textAlign: TextAlign.justify,
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
