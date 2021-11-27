class CategoryPlaint {
  String id;
  String libelle;
  String createdAt;
  String updatedAt;

  CategoryPlaint({
    this.id,
    this.libelle,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoryPlaint.fromJson(Map<String, dynamic> json){
    return CategoryPlaint(
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

