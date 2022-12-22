import 'package:ecommerce_project/Features/Models/LoginModels.dart';
import 'package:ecommerce_project/Features/Services/networkHandler.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static void login({email, password}) {
    LoginModel loginModel = LoginModel(email: email, password: password);
    NetWorkHandler.post(loginModelToJson(loginModel), "/user/signin");
  }
}
