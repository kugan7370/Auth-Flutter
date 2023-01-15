//cart controller
import 'dart:convert';

import 'package:ecommerce_project/controller/cart_food_controller.dart';
import 'package:ecommerce_project/data/repository/cart_food_repo.dart';
import 'package:ecommerce_project/model/cart_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  List<dynamic> _addCartList = [];

  //add product into cart
  Future<void> addToCart(data, int quantity) async {
    CartModel cartModel = CartModel(
        foodId: data.id,
        name: data.name,
        quantity: quantity,
        price: data.price,
        image: data.image,
        userId: "63b9ba08887a8734f69e43ab");

    _addCartList.clear();
    _addCartList.add(cartModel);
    update();

    var response = await cartRepo.addToCart(data: _addCartList);

    if (response != null) {
      print("response: ${response.body}");
    }
  }
}
