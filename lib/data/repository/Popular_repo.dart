import 'package:ecommerce_project/data/api/api_client.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  //this is intance of ApiClient class which we have already crated.
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future getPopularPriductList() async {
    return await apiClient.getData("/api/food/get-popular-foods");
  }
}
