import 'package:delivery_app/data/repository/cart_repo.dart';
import 'package:delivery_app/models/cart_model.dart';
import 'package:delivery_app/models/product.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, CartModel> _items = {};

  Map<int, CartModel> get items => _items;
  List<CartModel> storageItems = [];
  // var date = DateFormat('MM/dd/yyyy hh:mm a').format(DateTime.now());
  var date = DateTime.now().toString();
  void addItem(ProductModel product, int quantity) {
    if (_items.containsKey(product.id)) {
      _items.update(product.id!, (value) {
        return CartModel(
            id: value.id,
            name: value.name,
            img: value.img,
            price: value.price,
            created: value.created,
            time: date,
            exists: true,
            quantity: value.quantity! + quantity,
            product: product);
      });

      if (totalItems < 1) {
        _items.remove(product.id);
        update();
      }
      // if (items.isEmpty) {
      //   update();
      // }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(product.id!, () {
          return CartModel(
              id: product.id,
              name: product.name,
              img: product.img,
              price: product.price,
              created: product.createdAt,
              time: date,
              exists: true,
              quantity: quantity,
              product: product);
        });

        Get.snackbar('cart', '$quantity  items added to cart',
            backgroundColor: main1Color,
            colorText: appWhite,
            duration: Duration(seconds: 1));
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

  int get totalAmount {
    var total = 0;
    _items.forEach((key, value) {
      total += value.price! * value.quantity!;
    });
    return total;
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

//on cheout item
  void addToCartHistory() {
    cartRepo.addToHistoryList();
    clear();
  }

  void clear() {
    _items = {};
    update();
  }

  void clearCartHistort() {
    cartRepo.clearCartHistory();
    update();
  }

  List<CartModel> getCartHistoryList() {
    return cartRepo.getCartHistoryList();
  }

  set setItems(Map<int, CartModel> setItems) {
    _items = {};
    _items = setItems;
  }

  void addToCartList() {
    cartRepo.addToCartList(getCartItems);
    update();
  }
}
