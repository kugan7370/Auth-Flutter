import 'package:ecommerce_project/controller/popular_product_controller.dart';
import 'package:ecommerce_project/data/api/api_client.dart';
import 'package:ecommerce_project/data/repository/Popular_repo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: "https://fakestoreapi.com"));

  // repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  // no neet to use Get.find<apiClient>();

  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
