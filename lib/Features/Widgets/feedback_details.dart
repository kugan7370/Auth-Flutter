import 'package:ecommerce_project/Features/Widgets/small_text_widget.dart';
import 'package:flutter/material.dart';

class FeedbackWidget extends StatelessWidget {
  const FeedbackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        const SmaillText(
          text: "4.5",
          color: Color.fromARGB(255, 187, 185, 185),
        ),
        const SmaillText(
          text: "1,234 Comments",
          color: Color.fromARGB(255, 187, 185, 185),
        ),
      ],
    );
  }
}
