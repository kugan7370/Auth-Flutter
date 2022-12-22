import 'package:ecommerce_project/Features/Screens/SignIn.dart';
import 'package:ecommerce_project/Features/Screens/Signup.dart';
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
    ];
