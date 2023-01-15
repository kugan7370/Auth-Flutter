import 'package:ecommerce_project/Constant/global_colors.dart';
import 'package:ecommerce_project/Widgets/small_text_widget.dart';
import 'package:ecommerce_project/controller/popular_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodDetailIcons extends StatelessWidget {
  FoodDetailIcons({super.key, required this.foodDetials});
  final foodDetials;
  @override
  Widget build(BuildContext context) {
    // var product =
    //     Get.find<PopularProductController>().popularProductList[productId];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.price_change,
              /*circul sharp  */
              size: 12,
              color: Colors.orangeAccent,
            ),
            const SizedBox(
              width: 5,
            ),
            SmaillText(
              text: '\$ ${foodDetials.price.toString()}',
              color: const Color.fromARGB(255, 172, 169, 169),
            )
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.circle_sharp,
              /*location_on */
              size: 12,
              color: GlobalVariables.mainColor,
            ),
            const SizedBox(
              width: 5,
            ),
            SmaillText(
                text: foodDetials.category,
                color: const Color.fromARGB(255, 172, 169, 169))
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.access_time_rounded,
              size: 12,
              color: Colors.redAccent,
            ),
            const SizedBox(
              width: 5,
            ),
            SmaillText(
                text: "${foodDetials.deliveryTime.toString()} mins",
                color: const Color.fromARGB(255, 172, 169, 169))
          ],
        ),
      ],
    );
  }
}
