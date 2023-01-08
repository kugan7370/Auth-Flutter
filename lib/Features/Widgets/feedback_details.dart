import 'package:ecommerce_project/Features/Widgets/small_text_widget.dart';
import 'package:ecommerce_project/controller/popular_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackWidget extends StatelessWidget {
  FeedbackWidget({super.key, required this.productId});

  final int productId;
  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[productId];
    return Row(
      children: [
        Row(
          children: [
            for (var i = 1; i < 6; i++)
              const Icon(
                Icons.star,
                size: 12,
                color: Color.fromARGB(255, 2, 158, 54),
              )
          ],
        ),
        const SizedBox(width: 10),
        SmaillText(
          text: product.rating.toString(),
          color: const Color.fromARGB(255, 187, 185, 185),
        ),
        const SizedBox(width: 30),
        SmaillText(
          text: product.reviews.toString(),
          color: const Color.fromARGB(255, 187, 185, 185),
        ),
      ],
    );
  }
}
