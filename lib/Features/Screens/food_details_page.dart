import 'package:ecommerce_project/Constant/global_colors.dart';
import 'package:ecommerce_project/Features/Widgets/big_text_widgets.dart';
import 'package:ecommerce_project/Features/Widgets/feedback_details.dart';
import 'package:ecommerce_project/Features/Widgets/small_text_widget.dart';
import 'package:ecommerce_project/Features/Widgets/three_food_details.dart';
import 'package:ecommerce_project/controller/popular_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodDetailsScreen extends StatelessWidget {
  FoodDetailsScreen({super.key, required this.pageId});
  int pageId;

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
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
                    fit: BoxFit.cover, image: NetworkImage(product.image))),
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
              )
            ],
          ),
        ),
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
                  text: product.name,
                  size: 24,
                ),
                SizedBox(height: 20),
                FeedbackWidget(
                  productId: pageId,
                ),
                SizedBox(height: 20),
                FoodDetailIcons(
                  productId: pageId,
                ),
                SizedBox(height: 30),
                BigText(text: "Introduce"),
                Expanded(
                  child: SingleChildScrollView(
                    child: SmaillText(height: 2, text: product.description),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 140,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
                  const SmaillText(
                    text: "0",
                    size: 18,
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.add))
                ],
              ),
            ),
            Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
          ],
        ),
      ),
    );
  }
}
