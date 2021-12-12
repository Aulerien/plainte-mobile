import 'package:flutter/material.dart';
import 'package:plainte/models/plaint.dart';
import 'package:plainte/services/plaint.service.dart';
import 'package:plainte/utils/time-ago.service.dart';

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
              child: Text(widget.item.localisation),
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
                    getIconeEtatPlaint(widget.item.etatplainte?.libelle ?? ""),
                    SizedBox(width: 5,),
                    // date création
                    Text(
                      widget.item.etatplainte?.libelle ?? "-",
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
                    Text(displayDateCreation())
                  ],
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
          InkWell(
            onTap: () async {
              reaction("UP");
            },
            child:
            Column(
              children: [
                Icon(
                  Icons.thumb_up,
                  color: Colors.green,
                  size: 25,
                ),
                Text(
                    getReactionCount(widget.item.voteUp),
                    style: TextStyle(
                        fontSize: 15
                    )
                ),
              ],
            ),
          ),
          /*Column(
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
          ),*/
          InkWell(
          onTap: () async {
            reaction("DOWN");
            },
            child: Column(
              children: [
                Icon(
                  Icons.thumb_down,
                  color: Colors.red,
                  size: 25,
                ),
                Text(
                  getReactionCount(widget.item.voteDown),
                  style: TextStyle(
                      fontSize: 15
                  ),
                ),],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBodyItem() {
    Widget image = Container();
    if(widget.item.files != null && widget.item.files.length > 0){
      image = Container(
        child: Image.network(widget.item.files.first),
      );
    }
    return Padding(
      padding: EdgeInsets.only(top: 30, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
              widget.item.libelle
          ),
          SizedBox(height: 5,),
          image,
        ],
      ),
    );
  }

  String getReactionCount(num number) {
    if(number == null) return "0";
    int KILO = 1000;
    int MILLION = KILO * 1000;
    if( (number / MILLION) > 1) {
      return (number / MILLION).toStringAsFixed(1) + " M";
    }
    if( (number / KILO) > 1) {
      return (number / KILO).toStringAsFixed(1) + " K";
    }
    return number.toString();
  }

  String displayDateCreation() {
    return TimeAgoService.timeAgo(widget.item.createdAt);
  }

  Widget getIconeEtatPlaint(String etat) {
    // cloture
    if("CLOTURE" == etat) {
      return Icon(
        Icons.check_box,
        color: Colors.green,
      );
    }
    // retire
    if("RETIRE" == etat) {
      return Icon(
        Icons.remove_circle_outline,
        color: Colors.blueGrey,
      );
    }
    // rejete
    if("REJETE" == etat) {
      return Icon(
        Icons.delete_sweep,
        color: Colors.red,
      );
    }
    // en traitement
    if("EN TRAITEMENT" == etat) {
      return Icon(
        Icons.autorenew,
        color: Colors.blueAccent,
      );
    }
    // crée
    if("CREE" == etat) {
      return Icon(
        Icons.flag,
        color: Colors.grey,
      );
    }
    return Container();
  }

  reaction(String type) async {
    if("UP" == type) {
      setState( () {
        if(widget.item.voteUp == null) {
          widget.item.voteUp = 0;
        }
        widget.item.voteUp = widget.item.voteUp + 1;
      });
    } else {
      setState( () {
        if(widget.item.voteDown == null) {
          widget.item.voteDown = 0;
        }
        widget.item.voteDown = widget.item.voteDown + 1;
      });
    }
    var response = await PlaintService.reaction(widget.item.id, widget.item.voteUp, widget.item.voteDown);
    print(response.statusCode);
    print(response.body);
  }


}
