import 'package:ecommerce_project/Screens/main_food_page.dart';
import 'package:ecommerce_project/Screens/signin.dart';
import 'package:ecommerce_project/Screens/signup.dart';
import 'package:get/get.dart';

appRoutes() => [
      GetPage(
        name: '/signin',
        page: () => const SignInScreen(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 800),
      ),
      GetPage(
        name: '/signup',
        page: () => const SignupScreen(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 800),
      ),
      GetPage(
        name: '/home',
        page: () => const MainFoodScreen(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 800),
      ),
    ];
