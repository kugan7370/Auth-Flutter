import 'package:ecommerce_project/data/repository/Popular_repo.dart';
import 'package:ecommerce_project/model/popular_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
// create intance for PopularProductRepo class
  final PopularProductRepo popularProductRepo;

// intialize the contructor
  PopularProductController({required this.popularProductRepo});

// this is private variable
  List<dynamic> _popularProductList = [];
  bool _isload = false;

// to access the data we are using this method
  List<dynamic> get popularProductList => _popularProductList;
  bool get isLoading => _isload;

  Future<void> getPopularProductList() async {
    _isload = true;
    Response response = await popularProductRepo.getPopularPriductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(
          response.body.map((item) => ProductModel.fromJson(item)).toList());
      _isload = false;
      //to  get real time data
      update();
    }
  }
}
