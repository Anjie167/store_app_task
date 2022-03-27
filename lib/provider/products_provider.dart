import 'package:flutter/cupertino.dart';
import 'package:store_app_task/provider/models.dart';

class CartProvider extends ChangeNotifier{
  List<Products> cartItems= [];
  bool isLiked = false;
  double totalPrice = 0;

  subPrice(Products products){
    totalPrice = totalPrice - products.price;
    notifyListeners();
  }

  sumPrices(Products products){
    totalPrice = totalPrice + products.price;
    notifyListeners();
  }


  liked(Products products){
    cartItems.add(products);
    isLiked = !isLiked;
    notifyListeners();
  }

  unLiked(Products products){
    cartItems.remove(products);
    isLiked = !isLiked;
    notifyListeners();
  }


}