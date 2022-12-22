import 'package:ecommerce_project/Features/Screens/SignIn.dart';
import 'package:ecommerce_project/Routes/appRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load();
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
        initialRoute: '/signup',
        getPages: appRoutes(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SignInScreen());
  }
}
