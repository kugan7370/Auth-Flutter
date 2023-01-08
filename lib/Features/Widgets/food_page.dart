import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce_project/Constant/global_colors.dart';
import 'package:ecommerce_project/Features/Screens/food_details_page.dart';
import 'package:ecommerce_project/Features/Widgets/big_text_widgets.dart';
import 'package:ecommerce_project/Features/Widgets/feedback_details.dart';
import 'package:ecommerce_project/Features/Widgets/three_food_details.dart';
import 'package:ecommerce_project/controller/popular_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodPageBuilder extends StatefulWidget {
  const FoodPageBuilder({super.key});

  @override
  State<FoodPageBuilder> createState() => _FoodPageBuilderState();
}

class _FoodPageBuilderState extends State<FoodPageBuilder> {
  /*connect 2 pages------
  PageController is default controller
  */
  PageController pageController = PageController(viewportFraction: 0.85);
  double _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 240.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularProductController>(
      builder: (product) {
        return Column(
          children: [
            SizedBox(
              height: 320,
              child: PageView.builder(
                controller: pageController,
                itemCount: product.popularProductList.length,
                itemBuilder: (context, index) {
                  return _buildPageItem(index, product);
                },
              ),
            ),
            DotsIndicator(
              dotsCount: product.popularProductList.length > 0
                  ? product.popularProductList.length
                  : 1,
              position: _currentPageValue,
              decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            )
          ],
        );
      },
    );
  }

// create new widget
  Widget _buildPageItem(index, product) {
    // page bulider zoom effect and transforms.........................
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
        transform: matrix,
        // image container-----------------------------
        child: Stack(
          children: [
            GestureDetector(
              onTap: () => Get.to(FoodDetailsScreen(pageId: index)),
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                height: _height,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: index.isEven
                        ? Colors.lightBlueAccent
                        : const Color.fromARGB(255, 230, 154, 211),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            product.popularProductList[index].image))),
              ),
            ),

// shadow container-----------------

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                height: 140,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xffe8e8e8),
                        blurRadius: 1,
                        offset: Offset(0, 5),
                      ),
                    ]),
                child: Container(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(
                          text: product.popularProductList[index].name,
                          color: Colors.black54,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FeedbackWidget(productId: index),
                        const SizedBox(
                          height: 20,
                        ),
                        FoodDetailIcons(
                          productId: index,
                        )
                      ]),
                ),
              ),
            ),
          ],
        ));
  }
}
