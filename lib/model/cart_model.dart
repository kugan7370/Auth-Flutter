import 'dart:convert';

CartModel? cartModelFromJson(String str) =>
    CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel? data) => json.encode(data!.toJson());

class CartModel {
  CartModel(
      {required this.foodId,
      required this.name,
      required this.quantity,
      required this.price,
      required this.image,
      this.totalPrice});

  String foodId;
  String name;
  int quantity;
  double price;
  String image;
  double? totalPrice;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        foodId: json["foodId"],
        name: json["name"],
        quantity: json["quantity"],
        price: json["price"].toDouble(),
        image: json["image"],
        totalPrice: json["totalPrice"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "foodId": foodId,
        "name": name,
        "quantity": quantity,
        "price": price,
        "image": image,
        "totalPrice": totalPrice,
      };
}
