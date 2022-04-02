import 'dart:convert';
import 'package:delivery_app/models/cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  // final SharedPreferences sharedPreferences;

  // CartRepo({required this.sharedPreferences});

  List<String> cart = [];

  // void addToCartList(List<CartModel> cartList) {
  //   cart = [];
  //   //convering the cartmodel to a list

  //   cartList.forEach((element) {
  //     return cart.add(jsonEncode(element));
  //   });

  //   sharedPreferences.setStringList('cart-list', cart);
  //   print(sharedPreferences.getStringList('cart-list'));
  // }
}
