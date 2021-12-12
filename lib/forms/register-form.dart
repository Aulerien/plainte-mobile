class RegisterForm {
  String role = "usager";
  String fullname;
  String phone;
  String password;
  String email;
  bool active;

  RegisterForm({
    this.role,
    this.fullname,
    this.phone,
    this.password,
    this.email,
    this.active,
  });


  factory RegisterForm.fromJson(Map<String, dynamic> json){
    return RegisterForm(
      role: json["role"],
      fullname: json["fullname"],
      phone: json["phone"],
      password: json["password"],
      email: json["email"],
      active: json["active"],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'role' : role,
      'fullname' : fullname,
      'phone' : phone,
      'password' : password,
      'email' : email,
      'active' : active,
    };
  }

}
