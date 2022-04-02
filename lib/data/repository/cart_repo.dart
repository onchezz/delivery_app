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

    cartList.forEach((item) {
      return cart.add(jsonEncode(item));
    });

    sharedPreferences.setStringList(AppConstants.Cart_List, cart);
    print(sharedPreferences.getStringList(AppConstants.Cart_List));
  }

  List<CartModel> getCartList() {
    List<String> savedCart = [];

    if (sharedPreferences.containsKey(AppConstants.Cart_List)) {
      savedCart = sharedPreferences.getStringList(AppConstants.Cart_List)!;
    }

    List<CartModel> cartList = [];
    savedCart.forEach(
        (element) => cartList.add(CartModel.fromJson(jsonDecode(element))));
    return cartList;
  }
}
