import 'package:ecommerce_project/Screens/food_details_page.dart';
import 'package:ecommerce_project/Screens/main_food_page.dart';
import 'package:ecommerce_project/Screens/signin.dart';
import 'package:ecommerce_project/Widgets/recommended_food_details.dart';
import 'package:ecommerce_project/Routes/app_routes.dart';
import 'package:ecommerce_project/controller/all_food_controller.dart';
import 'package:ecommerce_project/controller/popular_product_controller.dart';
import 'package:ecommerce_project/controller/trending_food_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'helpers/dependancies.dart' as dep;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initials the env
  await dotenv.load();

  // initialize other dependancies
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        // initialRoute: "/signin",
        getPages: appRoutes(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SignInScreen());
  }
}
