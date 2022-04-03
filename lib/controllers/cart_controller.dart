import 'package:delivery_app/data/repository/cart_repo.dart';
import 'package:delivery_app/models/cart_model.dart';
import 'package:delivery_app/models/product.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, CartModel> _items = {};

  Map<int, CartModel> get items => _items;
  List<CartModel> storageItems = [];

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
            product: product);
      });

      if (totalItems < 1) {
        _items.remove(product.id);
        update();
      }
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
              product: product);
        });

        Get.snackbar('cart', '$quantity  items added to cart',
            backgroundColor: main1Color, colorText: appWhite);
      } else {
        Get.snackbar('item count', 'you should atleast add one more item  ',
            backgroundColor: main1Color, colorText: appWhite);
      }
    }
    cartRepo.addToCartList(getCartItems);
    update();
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

  List<CartModel> get getCartItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  List<CartModel> getCartData() {
    setCart = cartRepo.getCartList();

    return storageItems;
  }

  set setCart(List<CartModel> items) {
    storageItems = items;

    for (var i = 0; i < storageItems.length; i++) {
      _items.putIfAbsent(storageItems[i].product!.id!, () => storageItems[i]);
    }
  }
}
