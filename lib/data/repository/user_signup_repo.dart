import 'package:ecommerce_project/data/api/api_client.dart';
import 'package:get/get.dart';

class UserSignUpRepo extends GetxService {
  //this is intance of ApiClient class which we have already crated.
  final ApiClient apiClient;
  UserSignUpRepo({required this.apiClient});

  Future userSignUp(data) async {
    return await apiClient.postData("/api/user/register", data);
  }
}
