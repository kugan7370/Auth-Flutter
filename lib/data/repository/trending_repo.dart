//create trending repo
import 'package:ecommerce_project/data/api/api_client.dart';
import 'package:get/get.dart';

class TrendingRepo {
  final ApiClient apiClient;
  TrendingRepo({required this.apiClient});

  Future getTrendingFoodList() async {
    return await apiClient.getData("/api/food/get-trending-foods");
  }
}
