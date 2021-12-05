class EtatPlaint {
  String id;
  String libelle;
  String createdAt;
  String updatedAt;

  EtatPlaint({
    this.id,
    this.libelle,
    this.createdAt,
    this.updatedAt,
  });

  factory EtatPlaint.fromJson(Map<String, dynamic> json){
    return EtatPlaint(
      id: json["_id"],
      libelle: json["libelle"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"]
    );
  }

  @override
  String toString() {
    return 'CategoryPlaint{id: $id, libelle: $libelle, createdAt: $createdAt, updatedAt: $updatedAt}';
  }

}

