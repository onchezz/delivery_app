class SignUp {
  String email;
  String name;
  String phone;
  String password;
  SignUp(
      {required this.email,
      required this.name,
      required this.phone,
      required this.password});

  Map<String, dynamic> toJson() {
    return {
      "f_name": name,
      "phone": phone,
      "email": email,
      "password": password
    };
  }
}
