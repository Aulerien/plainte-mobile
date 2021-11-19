import 'package:flutter/material.dart';
import 'package:plainte/models/plaint.dart';

class PlaintItemWidget extends StatefulWidget {
  PlaintItemWidget({Key key, this.item, this.index, this.totalItems}): super(key: key);

  Plaint item;
  int totalItems;
  int index;

  @override
  _PlaintItemWidgetState createState() => _PlaintItemWidgetState();
}

class _PlaintItemWidgetState extends State<PlaintItemWidget> {

  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    return  buildItem(widget.item);
  }

  /// build item
  Widget buildItem(Plaint plaint ) {
    return Card(
      margin: EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: (widget.index + 1) != widget.totalItems ? 20 : 75,
          top: widget.index == 0 ? 20: 0
      ),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 7),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildHeaderItem(),
                  buildBodyItem(),
                  buildActionsItem(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// item header
  Widget buildHeaderItem() {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: Colors.purple,
            ),
            SizedBox(width: 5,),
            // le lieu
            Expanded(
              child: Text("Calavi, Godomey Salamin dans la rue de Maison Talon"),
            ),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    // seulement quand la plainte est fermée
                    Icon(
                      Icons.check_box,
                      color: Colors.green,
                    ),
                    SizedBox(width: 5,),
                    // date création
                    Text(
                        "Nouveau | En cours | Fermée",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Icon(
                    Icons.timer,
                    color: Colors.purple,
                  ),
                    SizedBox(width: 5,),
                    // date création
                    Text("Il y a 1h")],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget buildActionsItem() {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Icon(
                Icons.thumb_up,
                color: Colors.green,
                size: 25,
              ),
              Text(
                  widget.item.number_like_up?.toString() ?? '',
                  style: TextStyle(
                      fontSize: 15
                  )
              ),
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.remove_red_eye,
                color: Colors.black,
                size: 25,
              ),
              Text(
                  widget.item.number_views?.toString() ?? '0',
                  style: TextStyle(
                      fontSize: 15
                  )
              ),
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.thumb_down,
                color: Colors.red,
                size: 25,
              ),
              Text(
                widget.item.number_like_down?.toString() ?? '',
                style: TextStyle(
                    fontSize: 15
                ),
              ),],
          ),
        ],
      ),
    );
  }

  Widget buildBodyItem() {
    // TODO: type item in [TEXT, IMAGE, VIDEO, AUDIO]
    return Padding(
      padding: EdgeInsets.only(top: 30, bottom: 20),
      child: Text(
          widget.item.text
      ),
    );
  }




}
