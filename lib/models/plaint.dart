import 'package:plainte/models/category-plaint.dart';
import 'package:plainte/models/etat-plaint.dart';

class Plaint {
  String libelle;
  String localisation;
  List<String> files;
  CategoryPlaint categorie;
  DateTime createdAt;
  DateTime updatedAt;
  EtatPlaint etatplainte;
  num number_like_down;
  num number_views;
  num number_like_up;

  Plaint({
    this.libelle,
    this.localisation,
    this.files,
    this.categorie,
    this.etatplainte,
    this.createdAt,
    this.updatedAt,
  });

  factory Plaint.fromJson(Map<String, dynamic> json){
    return Plaint(
      libelle: json["libelle"],
      localisation: json["localisation"],
      files: (json["files"] as Iterable).map((e) => e.toString()).toList(),
      categorie: CategoryPlaint.fromJson(json['categorie']),
      etatplainte: EtatPlaint.fromJson(json['etatplainte']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['createdAt']),
    );
  }

}

