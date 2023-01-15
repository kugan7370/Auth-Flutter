class UserSignUpModel {
  UserSignUpModel({
    required this.email,
    required this.password,
    required this.name,
    required this.confirmPassword,
  });

  String email;
  String password;
  String name;
  String confirmPassword;

  factory UserSignUpModel.fromJson(Map<String, dynamic> json) =>
      UserSignUpModel(
        email: json["email"],
        password: json["password"],
        name: json["name"],
        confirmPassword: json["confirmPassword"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "name": name,
        "confirmPassword": confirmPassword,
      };
}
