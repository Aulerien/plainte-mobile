class Plaint {
  num date;
  String lieu;
  String text;
  String file;
  String categorie;
  num number_like_up;
  num number_like_down;
  num number_views;
  String plaint_status;

  Plaint({
    this.date,
    this.lieu,
    this.text,
    this.file,
    this.categorie,
    this.number_like_up,
    this.number_like_down,
    this.number_views,
    this.plaint_status
  });

  factory Plaint.fromJson(Map<String, dynamic> json){
    return Plaint(
      date: json["date"],
      lieu: json["lieu"],
      text: json["text"],
      file: json["file"],
      categorie: json["categorie"],
      number_like_up: json["number_like_up"],
      number_like_down: json["number_like_down"],
      number_views: json["number_views"],
      plaint_status: json["plaint_status"],
    );
  }

}

