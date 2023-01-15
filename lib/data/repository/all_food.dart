//create all product repo
import 'package:ecommerce_project/data/api/api_client.dart';
import 'package:get/get.dart';

class AllFoodRepo {
  final ApiClient apiClient;
  AllFoodRepo({required this.apiClient});

  Future getAllProductList() async {
    return await apiClient.getData("/api/food/get-foods");
  }
}
