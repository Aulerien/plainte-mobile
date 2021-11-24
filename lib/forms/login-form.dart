class LoginForm {
  String login;
  String password;

  LoginForm({
    this.login,
    this.password
  });

  factory LoginForm.fromJson(Map<String, dynamic> json){
    return LoginForm(
        login: json["login"],
        password: json["password"]
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'login': login,
      'password': password,
    };
  }

}
