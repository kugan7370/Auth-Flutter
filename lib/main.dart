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
import 'package:shared_preferences/shared_preferences.dart';
import 'helpers/dependancies.dart' as dep;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initials the env
  await dotenv.load();

  // initialize other dependancies
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  String access_token = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkToken();
  }

  checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    if (token != null) {
      setState(() {
        access_token = token;
      });

      // Token is available, user is logged in
    } else {
      setState(() {
        access_token = "";
      });

      // Token is not available, user is not logged in
    }
  }

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
        home: access_token.isEmpty ? SignInScreen() : MainFoodScreen());
  }
}
