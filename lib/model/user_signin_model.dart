class UserSignInModel {
  UserSignInModel({
    required this.email,
    required this.password,
  });

  String email;
  String password;

  // factory UserSignInModel.fromJson(Map<String, dynamic> json) => UserSignInModel(
  //     email: json["email"],
  //     password: json["Password"],
  // );

  Map<String, dynamic> toJson() => {
        "email": email,
        "Password": password,
      };
}
