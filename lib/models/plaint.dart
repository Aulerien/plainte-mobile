import 'package:plainte/models/category-plaint.dart';
import 'package:plainte/models/etat-plaint.dart';

class Plaint {
  String id;
  String libelle;
  String localisation;
  List<String> files;
  CategoryPlaint categorie;
  DateTime createdAt;
  DateTime updatedAt;
  EtatPlaint etatplainte;
  num voteUp;
  num voteDown;

  Plaint({
    this.id,
    this.libelle,
    this.localisation,
    this.files,
    this.categorie,
    this.etatplainte,
    this.createdAt,
    this.updatedAt,
    this.voteUp,
    this.voteDown,
  });

  factory Plaint.fromJson(Map<String, dynamic> json){
    return Plaint(
      id: json["_id"],
      libelle: json["libelle"],
      localisation: json["localisation"],
      files: (json["files"] as Iterable).map((e) => e.toString()).toList(),
      categorie: CategoryPlaint.fromJson(json['categorie']),
      etatplainte: EtatPlaint.fromJson(json['etatplainte']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['createdAt']),
      voteUp: json['voteUp'],
      voteDown: json['voteDown'],
    );
  }

}

