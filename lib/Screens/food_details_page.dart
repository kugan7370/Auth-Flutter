import 'package:ecommerce_project/Constant/global_colors.dart';
import 'package:ecommerce_project/Widgets/big_text_widgets.dart';
import 'package:ecommerce_project/Widgets/feedback_details.dart';
import 'package:ecommerce_project/Widgets/small_text_widget.dart';
import 'package:ecommerce_project/Widgets/three_food_details.dart';
import 'package:ecommerce_project/controller/all_food_controller.dart';
import 'package:ecommerce_project/controller/cart_food_controller.dart';
import 'package:ecommerce_project/controller/popular_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodDetailsScreen extends StatefulWidget {
  FoodDetailsScreen({super.key, required this.pageId});
  String pageId;

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      Get.find<PopularProductController>().initQuantity();
    });
  }

  @override
  Widget build(BuildContext context) {
    var allFoodDetails = Get.find<AllFoodController>().allFoodList;
    var cartController = Get.find<CartController>();

//filter by food id
    var foodDetail = allFoodDetails
        .where((element) => element.id == widget.pageId)
        .toList()[0];

    // var product = Get.find<AllFoodController>().allFoodList;

    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: Container(
            height: 350,
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(foodDetail.image))),
          ),
        ),
        Positioned(
          top: 40,
          left: 25,
          right: 25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Icon(Icons.arrow_back),
                ),
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: const Icon(Icons.shopping_cart_outlined),
              ),
            ],
          ),
        ),
        Positioned(
            top: 40,
            right: 15,
            child: GetBuilder<PopularProductController>(
                builder: (popularProductController) {
              return Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      popularProductController.getTotalQuantity().toString(),
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ));
            })),
        Positioned(
          top: 320,
          right: 0,
          left: 0,
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: Colors.white,
            ),
            height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(
                  text: foodDetail.name,
                  size: 24,
                ),
                SizedBox(height: 20),
                FeedbackWidget(
                  foodDetials: foodDetail,
                ),
                SizedBox(height: 20),
                FoodDetailIcons(
                  foodDetials: foodDetail,
                ),
                SizedBox(height: 30),
                BigText(text: "Introduce"),
                Expanded(
                  child: SingleChildScrollView(
                    child: SmaillText(height: 2, text: foodDetail.description),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
      // bottomNavigationBar-------------------------------
      bottomNavigationBar: Container(
          height: 100,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: GetBuilder<PopularProductController>(
            builder: (productController) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 140,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              productController.removeQuantity();
                            },
                            icon: const Icon(Icons.remove)),
                        SmaillText(
                          text: productController.quantity.toString(),
                          size: 18,
                        ),
                        IconButton(
                            onPressed: () {
                              productController.addQuantity();
                            },
                            icon: const Icon(Icons.add))
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      cartController.addToCart(
                        foodDetail,
                        productController.quantity,
                      );
                    },
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: GlobalVariables.mainColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          SmaillText(
                            text: "\$80.0",
                            size: 18,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          BigText(
                            text: "Add Cart",
                            size: 18,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }
}
