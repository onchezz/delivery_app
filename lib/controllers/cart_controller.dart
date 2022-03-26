import 'package:delivery_app/data/repository/cart_repo.dart';
import 'package:delivery_app/models/cart_model.dart';
import 'package:delivery_app/models/product.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  final Map<int, CartModel> _items = {};

  Map<int, CartModel> get items => _items;

  void addItem(ProductModel product, int quantity) {
    if (_items.containsKey(product.id)) {
      _items.update(product.id!, (value) {
        return CartModel(
          id: value.id,
          name: value.name,
          img: value.img,
          price: value.price,
          createdAt: DateTime.now().toString(),
          exists: true,
          quantity: value.quantity! + quantity,
        );
      });
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(product.id!, () {
          return CartModel(
            id: product.id,
            name: product.name,
            img: product.img,
            price: product.price,
            createdAt: DateTime.now().toString(),
            exists: true,
            quantity: quantity,
          );
        });

        Get.snackbar('cart', '$quantity  items added to cart',
            backgroundColor: main1Color, colorText: appWhite);
      } else {
        Get.snackbar('item count', 'you should atleast add one more item  ',
            backgroundColor: main1Color, colorText: appWhite);
      }
    }
  }

  bool ifExists(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }
}

// mm m 
