import 'package:ecommerce_project/data/api/api_client.dart';
import 'package:get/get.dart';

class UserSignInRepo extends GetxService {
  //this is intance of ApiClient class which we have already crated.
  final ApiClient apiClient;
  UserSignInRepo({required this.apiClient});

  Future userSignin(data) async {
    return await apiClient.postData("/api/user/login", data);
  }
}
