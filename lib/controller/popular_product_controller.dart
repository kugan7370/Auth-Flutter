// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

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

  int _quantity = 1;

  //get quantity
  int get quantity => _quantity;

  var items = {};

  Future<void> getPopularProductList() async {
    var response = await popularProductRepo.getPopularPriductList();
    if (response != null) {
      _popularProductList = [];
      _popularProductList.addAll(jsonDecode(response)["data"]
          .map((item) => ProductModel.fromJson(item))
          .toList());

      //to  get real time data
      update();
    }
  }

//init quantity
  void initQuantity() {
    _quantity = 1;
  }

//add quantity
  void addQuantity() {
    _quantity++;
    update();
  }

  //remove quantity
  void removeQuantity() {
    if (_quantity > 1) {
      _quantity--;
      update();
    }
  }

  //add to cart
  void addToCart(productModel) {
    if (items.containsKey(productModel.id)) {
      items[productModel.id] = {
        'product': productModel,
        'quantity': items[productModel.id]['quantity'] + _quantity,
      };
    } else {
      items[productModel.id] = {
        'product': productModel,
        'quantity': _quantity,
      };
    }
    update();
  }

  //get total quantity
  getTotalQuantity() {
    dynamic totalQuantity = 0;
    items.forEach((key, value) {
      totalQuantity += value['quantity'];
    });
    return totalQuantity;
  }
}
