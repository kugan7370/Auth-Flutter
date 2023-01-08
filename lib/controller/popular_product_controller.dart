import 'package:ecommerce_project/data/repository/Popular_repo.dart';
import 'package:ecommerce_project/model/popular_product_model.dart';
import 'package:ecommerce_project/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
// create intance for PopularProductRepo class
  final PopularProductRepo popularProductRepo;

// intialize the contructor
  PopularProductController({required this.popularProductRepo});

// this is private variable
  List<dynamic> _popularProductList = [];

// to access the data we are using this method
  List<dynamic> get popularProductList => _popularProductList;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularPriductList();
    print(response.body["data"]);
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(response.body["data"]
          .map((item) => ProductModel.fromJson(item))
          .toList());

      //to  get real time data
      update();
    }
  }

//
}
