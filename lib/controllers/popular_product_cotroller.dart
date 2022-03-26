import 'package:delivery_app/controllers/cart_controller.dart';
import 'package:delivery_app/data/repository/popular_product_repo.dart';
import 'package:delivery_app/models/cart_model.dart';
import 'package:delivery_app/models/product.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int neededItems = 20;
  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;
  late CartController _cart;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPupularList();

    if (response.statusCode == 200) {
      _isLoaded = true;
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      update();
    } else {
      print('failed to get products');
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      print('items added  ' + _quantity.toString());
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
      print('items removed  ' + _quantity.toString());
    }

    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      if (_inCartItems > 0) {
        _quantity = -_inCartItems;
        return _quantity;
      }
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      Get.snackbar('item count', 'only $neededItems items available ',
          backgroundColor: main1Color);
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(
    CartController cart,
    ProductModel product,
  ) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exists = false;
    exists = _cart.ifExists(product);
    if (exists) {
      _inCartItems = _cart.getQuantity(product);
    }
    print("Quantyty in the cart is $_inCartItems");
    print("if item exits $exists");
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);
    _cart.items.forEach((key, value) {
      print(
          "product id is${value.id} and name is ${value.name} items in cart are ${value.quantity} ");
    });
    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get cartItems {
    return _cart.getCartItems;
  }
}
