import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    required this.email,
    required this.password,
    required this.username,
    required this.confirmPassword,
  });

  String email;
  String password;
  String username;
  String confirmPassword;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        email: json["email"],
        password: json["Password"],
        username: json["username"],
        confirmPassword: json["ConfirmPassword"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "Password": password,
        "username": username,
        "ConfirmPassword": confirmPassword,
      };
}
