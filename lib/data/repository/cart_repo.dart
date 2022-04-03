import 'dart:convert';
import 'package:delivery_app/models/cart_model.dart';
import 'package:delivery_app/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> cart = [];

  void addToCartList(List<CartModel> cartList) {
    cart = [];
    //converting the cartmodel to a list

    cartList.forEach((item) => cart.add(jsonEncode(item)));

    sharedPreferences.setStringList(AppConstants.Cart_List, cart);
    // print(sharedPreferences.getStringList(AppConstants.Cart_List));

    getCartList();
  }

  List<CartModel> getCartList() {
    List<String> carts = [];

    if (sharedPreferences.containsKey(AppConstants.Cart_List)) {
      carts = sharedPreferences.getStringList(AppConstants.Cart_List)!;
      print('geting cart list from local storage ');
      print(carts);
    }

    List<CartModel> cartList = [];

    carts.forEach(
        (element) => cartList.add(CartModel.fromJson(jsonDecode(element))));

    return cartList;
  }
}
