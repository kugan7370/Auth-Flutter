import 'package:ecommerce_project/Constant/global_colors.dart';
import 'package:ecommerce_project/Features/Widgets/big_text_widgets.dart';
import 'package:ecommerce_project/Features/Widgets/small_text_widget.dart';
import 'package:ecommerce_project/Features/Widgets/three_food_details.dart';
import 'package:flutter/material.dart';

class ListViewFood extends StatelessWidget {
  const ListViewFood({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(left: 20, bottom: 15),
          child: Row(
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(GlobalVariables.carouselImages[index]),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.white,
                          offset: Offset(5, 5),
                          blurRadius: 1)
                    ],
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        BigText(
                          text: "Nutrious food meals of our application",
                          size: 18,
                        ),
                        SizedBox(height: 20),
                        SmaillText(text: "List of food description"),
                        SizedBox(height: 20),
                        FoodDetailIcons()
                      ]),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
