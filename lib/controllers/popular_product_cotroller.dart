import 'package:delivery_app/controllers/cart_controller.dart';
import 'package:delivery_app/data/repository/popular_product_repo.dart';
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
  int items = 20;
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
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (quantity < 0) {
      return 0;
    } else if (quantity > items) {
      Get.snackbar('item count', 'only $items items available ',
          backgroundColor: main1Color);
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(
    CartController cart,
  ) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
  }

  void addItem(ProductModel product) {
    
    _cart.addItem(product, _quantity);
  }
}
