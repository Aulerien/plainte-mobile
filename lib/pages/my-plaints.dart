import 'package:flutter/material.dart';
import 'package:plainte/models/plaint.dart';
import 'package:plainte/partials/plaint-item-widget.dart';

class MyPlaintsPage extends StatefulWidget {
  MyPlaintsPage({Key key}): super(key: key);

  final String title = "Mes plaintes";
  List<Plaint> items = [];

  @override
  _MyPlaintsPageState createState() => _MyPlaintsPageState();
}

class _MyPlaintsPageState extends State<MyPlaintsPage> {
  @override
  void initState() {
    /*widget.items = [
      new Plaint(
          DateTime.now().millisecond,
          "Bohicon, Houegbé",
          "Dans la zone me Maria GLETA il y a des hommes et des femmes qui viennent la nuit. Je ne sais pas pourquoi",
          "", "", 100, 10, 140, "VALIDEE"
      ),
    ];
    widget.items =  List.filled(30, widget.items[0]);*/
  }

  @override
  Widget build(BuildContext context) {
    if(widget.items.length == 0) {
      return Center(
        child: Text(
          "Vos plaintes vont s'afficher ici...",
          style: TextStyle(
            fontSize: 16,
          ),
          textAlign: TextAlign.justify,
        ),
      );
    }
    return  ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        return buildItem(context, index);
      },
      shrinkWrap: true,
    );
  }

  /// build item
  Widget buildItem(BuildContext context, int index ) {
    return PlaintItemWidget(index: index, item: widget.items[index], totalItems: widget.items.length,);
  }

}
