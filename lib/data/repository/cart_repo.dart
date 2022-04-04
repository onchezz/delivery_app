import 'dart:convert';
import 'package:delivery_app/models/cart_model.dart';
import 'package:delivery_app/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  List<String> cartHistoryList = [];
  void clearCartHistory() {
    cartHistoryList.clear();
    sharedPreferences.remove(AppConstants.Cart_History_List);
  }

  void addToCartList(List<CartModel> cartList) {
    sharedPreferences.remove(AppConstants.Cart_List);

    cart = [];
    //converting the cartmodel to a list
    var time = DateTime.now().toString();
    cartList.forEach((item) {
      item.time = time;
      return cart.add(jsonEncode(item));
    });

    sharedPreferences.setStringList(AppConstants.Cart_List, cart);
    print(sharedPreferences.getStringList(AppConstants.Cart_List));

    // getCartList();
  }

  List<CartModel> getCartList() {
    List<String> carts = [];

    if (sharedPreferences.containsKey(AppConstants.Cart_List)) {
      carts = sharedPreferences.getStringList(AppConstants.Cart_List)!;
      // print('geting cart list from local storage ');
      // print(carts);
    }

    List<CartModel> cartList = [];

    carts.forEach(
        (element) => cartList.add(CartModel.fromJson(jsonDecode(element))));

    return cartList;
  }

  List<CartModel> getCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.Cart_History_List)) {
      cartHistoryList = [];
      cartHistoryList =
          sharedPreferences.getStringList(AppConstants.Cart_History_List)!;
    }
    List<CartModel> cartHistory = [];

    for (var element in cartHistoryList) {
      cartHistory.add(CartModel.fromJson(jsonDecode(element)));
    }
    // sharedPreferences.remove(AppConstants.Cart_History_List);
    return cartHistory;
  }

  void addToHistoryList() {
    for (var i = 0; i < cart.length; i++) {
      print('cart history ' + cart[i]);
      cartHistoryList.add(cart[i]);
    }
    remove();
    sharedPreferences.setStringList(
        AppConstants.Cart_History_List, cartHistoryList);
    print(getCartHistoryList().length.toString());
    for (var f = 0; f < getCartHistoryList().length; f++) {
      print(getCartHistoryList()[f].time);
    }
  }

  void remove() {
    cart.clear();
    sharedPreferences.remove(AppConstants.Cart_List);
  }
}
