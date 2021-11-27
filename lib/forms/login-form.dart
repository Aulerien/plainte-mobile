class LoginForm {
  //String login;
  String phone;
  String password;

  LoginForm({
   // this.login,
    this.phone,
    this.password
  });

  factory LoginForm.fromJson(Map<String, dynamic> json){
    return LoginForm(
       // login: json["login"],
        phone: json["phone"],
        password: json["password"]
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      //'login': login,
      'phone': phone,
      'password': password,
    };
  }

}
