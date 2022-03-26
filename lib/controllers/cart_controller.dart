import 'package:delivery_app/data/repository/cart_repo.dart';
import 'package:delivery_app/models/cart_model.dart';
import 'package:delivery_app/models/product.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, CartModel> _items = {};

  void addItem(ProductModel product, int quantity) {
    _items.putIfAbsent(product.id!, () {
      print('$quantity items added to cart  /n   productid: ${product.id}');

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

    _items.forEach((key, value) {
      print('${value.name}  :${value.quantity.toString()}');
    });
  }
}

// mm m 
