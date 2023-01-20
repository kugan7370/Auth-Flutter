//create all product repo
import 'package:ecommerce_project/data/api/api_client.dart';
import 'package:get/get.dart';

class CartRepo {
  final ApiClient apiClient;
  CartRepo({required this.apiClient});

  Future getAllCartList() async {
    return await apiClient.getData("/api/cart/get-cart-items");
  }

  Future addToCart({required data}) async {
    print("hiiii");
    return await apiClient.postData("/api/cart/add-cart-item", data);
  }
}
