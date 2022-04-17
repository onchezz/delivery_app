import 'dart:convert';
import 'package:delivery_app/models/cart_model.dart';
import 'package:delivery_app/utils/app_constants.dart';
import 'package:intl/intl.dart';
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
    cart.clear();
    var date = DateFormat('dd/MM/yyyy hh:mm a').format(DateTime.now());
    // cart = [];
    //converting the cartmodel to a list
    // var date = DateTime.now().toString();
    // var date = DateFormat('MM/dd/yyyy hh:mm a').format(DateTime.now());
    // cartList.forEach((item) {
    //   item.time = date;
    //   return cart.add(jsonEncode(item));
    // });

    for (var i = 0; i < cartList.length; i++) {
      cartList[i].time = date;

      cart.add(jsonEncode(cartList[i]));
    }

    sharedPreferences.setStringList(AppConstants.Cart_List, cart);
    // print(sharedPreferences.getStringList(AppConstants.Cart_List));
  }

  List<CartModel> getCartList() {
    List<String> carts = [];

    if (sharedPreferences.containsKey(AppConstants.Cart_List)) {
      carts = sharedPreferences.getStringList(AppConstants.Cart_List)!;
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
    cart.forEach((element) {
      if (cartHistoryList.contains(element)) {
        // print('contains element' + element);
      } else {
        cartHistoryList.add(element);
      }
    });

    remove();
    sharedPreferences.setStringList(
        AppConstants.Cart_History_List, cartHistoryList);
    // print('length of history list' + getCartHistoryList().length.toString());
    // getCartHistoryList().forEach((element) {
    // print(element.name.toString() + "is added to cart history List");
    // });
  }

  void remove() {
    cart = [];
    sharedPreferences.remove(AppConstants.Cart_List);
  }
}
