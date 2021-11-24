class RegisterForm {
  String role = "usager";
  String fullname;
  String phone;
  String password;
  String email;
  String createdAt;
  String updatedAt;
  String id;

  RegisterForm({
    this.role,
    this.fullname,
    this.phone,
    this.password,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.id,
  });


  factory RegisterForm.fromJson(Map<String, dynamic> json){
    return RegisterForm(
      role: json["role"],
      fullname: json["fullname"],
      phone: json["phone"],
      password: json["password"],
      email: json["email"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
      id: json["id"],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'role' : role,
      'fullname' : fullname,
      'phone' : phone,
      'password' : password,
      'email' : email,
      'createdAt' : createdAt,
      'updatedAt' : updatedAt,
      'id' : id,
    };
  }

}
