//all food controller
import 'dart:convert';

import 'package:ecommerce_project/data/repository/all_food.dart';
import 'package:ecommerce_project/model/all_food_model.dart';
import 'package:get/get.dart';

class AllFoodController extends GetxController {
  //this is instance of AllFoodRepo class which we have already created.
  final AllFoodRepo allFoodRepo;
  AllFoodController({required this.allFoodRepo});

  //this is private variable
  List<dynamic> _allFoodList = [];

  //to access the data we are using this method
  List<dynamic> get allFoodList => _allFoodList;

  Future<void> getAllFoodList() async {
    var response = await allFoodRepo.getAllProductList();

    if (response != null) {
      _allFoodList = [];
      _allFoodList.addAll(jsonDecode(response)["data"]
          .map((item) => AllFoodModel.fromJson(item))
          .toList());

      //to  get real time data
      update();
    }
  }
}
