import 'package:ecommerce_project/Constant/global_colors.dart';
import 'package:ecommerce_project/Features/Widgets/small_text_widget.dart';
import 'package:flutter/material.dart';

class FoodDetailIcons extends StatelessWidget {
  const FoodDetailIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: const [
            Icon(
              Icons.circle_sharp,
              size: 12,
              color: Colors.orangeAccent,
            ),
            SizedBox(
              width: 5,
            ),
            SmaillText(
              text: "Normal",
              color: Color.fromARGB(255, 172, 169, 169),
            )
          ],
        ),
        Row(
          children: const [
            Icon(
              Icons.location_on,
              size: 12,
              color: GlobalVariables.mainColor,
            ),
            SizedBox(
              width: 5,
            ),
            SmaillText(text: "32km", color: Color.fromARGB(255, 172, 169, 169))
          ],
        ),
        Row(
          children: const [
            Icon(
              Icons.access_time_rounded,
              size: 12,
              color: Colors.redAccent,
            ),
            SizedBox(
              width: 5,
            ),
            SmaillText(text: "32min", color: Color.fromARGB(255, 172, 169, 169))
          ],
        ),
      ],
    );
  }
}
