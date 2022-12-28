import 'package:ecommerce_project/Constant/global_colors.dart';
import 'package:ecommerce_project/Features/Widgets/big_text_widgets.dart';
import 'package:ecommerce_project/Features/Widgets/food_page.dart';
import 'package:ecommerce_project/Features/Widgets/list_views.dart';
import 'package:ecommerce_project/Features/Widgets/small_text_widget.dart';
import 'package:flutter/material.dart';

class MainFoodScreen extends StatefulWidget {
  const MainFoodScreen({super.key});

  @override
  State<MainFoodScreen> createState() => _MainFoodScreenState();
}

class _MainFoodScreenState extends State<MainFoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //header--------------------------------------------
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(
                            text: "Srilanka", color: GlobalVariables.mainColor),
                        Row(
                          children: const [
                            SmaillText(text: "Colombo"),
                            Icon(Icons.arrow_drop_down_rounded)
                          ],
                        )
                      ],
                    ),
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: GlobalVariables.mainColor),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            size: 25,
                            color: Colors.white,
                          )),
                    ),
                  ],
                )),
            const SizedBox(
              height: 30,
            ),

            //food body-----------------------------
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //pageBuilder------------------------------------------------------

                    const FoodPageBuilder(),
                    const SizedBox(
                      height: 20,
                    ),

                    // Popular Page....................................................
                    Container(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: BigText(text: "Popular"),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    // list view.........................
                    const ListViewFood()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
