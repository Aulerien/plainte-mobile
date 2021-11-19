import 'package:flutter/material.dart';
import 'package:plainte/models/plaint.dart';
import 'package:plainte/partials/plaint-item-widget.dart';

class NewsPlaintsPage extends StatefulWidget {
  NewsPlaintsPage({Key key}): super(key: key);

  final String title = "Actualités";
  List<Plaint> items = [];

  @override
  _NewsPlaintsPageState createState() => _NewsPlaintsPageState();
}

class _NewsPlaintsPageState extends State<NewsPlaintsPage> {

  @override
  void initState() {
    widget.items = [
      new Plaint(
        DateTime.now().millisecond,
        "Abomey Calavi, Gogomey, Echangeur",
        "Ils ont vol",
        "", "", 192, 11, 17, "VALIDEE"
      ),
    ];
    widget.items =  List.filled(30, widget.items[0]);
  }

  @override
  Widget build(BuildContext context) {
    if(widget.items.length == 0) {
      return Center(
        child: Text(
          "Les plaintes vont s'afficher ici...",
          style: TextStyle(
            fontSize: 20,
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
