import 'package:ecommerce_project/Widgets/small_text_widget.dart';
import 'package:ecommerce_project/controller/popular_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackWidget extends StatelessWidget {
  FeedbackWidget({super.key, required this.foodDetials});

  final foodDetials;
  @override
  Widget build(BuildContext context) {
    // var product =

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
          text: foodDetials.rating.toString(),
          color: const Color.fromARGB(255, 187, 185, 185),
        ),
        const SizedBox(width: 30),
        SmaillText(
          text: foodDetials.reviews.toString(),
          color: const Color.fromARGB(255, 187, 185, 185),
        ),
      ],
    );
  }
}
