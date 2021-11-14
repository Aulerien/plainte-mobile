extension extString on String {

  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName{
    /* final nameRegExp = new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this); */
    if(this.isEmpty) return false;
    if(this.trim().isEmpty) return false;
    final nameRegExp = new RegExp("([a-zA-Z',.-]+( [a-zA-Z',.-]+)*){2,50}");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword{
    final passwordRegExp = new RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull{
    return this != null;
  }


  bool get isValidPhone{
    final phoneRegExp = RegExp(r"^\+(?:[0-9]?){6,14}[0-9]$");
    return phoneRegExp.hasMatch(this);
  }


}