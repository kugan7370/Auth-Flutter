import 'package:ecommerce_project/Features/Models/LoginModels.dart';
import 'package:ecommerce_project/Features/Models/RegisterModel.dart';
import 'package:ecommerce_project/Features/Services/networkHandler.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  static void register({email, password, username, confirmPassword}) {
    RegisterModel registerModel = RegisterModel(
        email: email,
        password: password,
        username: username,
        confirmPassword: confirmPassword);
    NetWorkHandler.post(registerModelToJson(registerModel), "/user/signup");
  }
}
