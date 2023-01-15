// Trending food controller

import 'dart:convert';

import 'package:ecommerce_project/data/repository/trending_repo.dart';
import 'package:ecommerce_project/model/trending_food_model.dart';
import 'package:get/get.dart';

class TrendingFoodController extends GetxController {
  //create intance for TrendingRepo class
  final TrendingRepo trendingRepo;

  // intialize the contructor
  TrendingFoodController({required this.trendingRepo});

  // this is private variable
  List<dynamic> _trendingFoodList = [];

  // to access the data we are using this method
  List<dynamic> get trendingFoodList => _trendingFoodList;

  Future<void> getTrendingFoodList() async {
    var response = await trendingRepo.getTrendingFoodList();

    if (response != null) {
      _trendingFoodList = [];
      _trendingFoodList.addAll(jsonDecode(response)["data"]
          .map((item) => TrendingFoodModel.fromJson(item))
          .toList());

      //to  get real time data
      update();
    }
  }
}
