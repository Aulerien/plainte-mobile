import 'package:flutter/material.dart';
import 'package:plainte/models/plaint.dart';
import 'package:plainte/partials/plaint-item-widget.dart';

class PlaintsClosedPage extends StatefulWidget {
  PlaintsClosedPage({Key key}): super(key: key);

  final String title = "Plaintes traitées";
  List<Plaint> items = [];

  @override
  _PlaintsClosedPageState createState() => _PlaintsClosedPageState();
}

class _PlaintsClosedPageState extends State<PlaintsClosedPage> {

  @override
  void initState() {
    widget.items = [
      new Plaint(
          DateTime.now().millisecond,
          "Akpka Avotrou",
          "Ils étaient environ 10 dans l quartier ce matin",
          "", "", 350, 20, 400, "VALIDEE"
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
