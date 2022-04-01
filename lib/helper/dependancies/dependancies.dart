import 'package:delivery_app/controllers/cart_controller.dart';
import 'package:delivery_app/controllers/popular_product_cotroller.dart';
import 'package:delivery_app/controllers/recomended_product.dart';
import 'package:delivery_app/data/api/api_client.dart';
import 'package:delivery_app/data/repository/cart_repo.dart';
import 'package:delivery_app/data/repository/popular_product_repo.dart';
import 'package:delivery_app/data/repository/recomended_repo.dart';
import 'package:delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  //sharedPrefelences
  // final sharedPreferences = SharedPreferences.getInstance();
  final Future<SharedPreferences> sharedPreferences =
      SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  //api clients
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

//repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecomendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  Get.lazyPut(
      () => RecomendedProductController(recomendedProductRepo: Get.find()));
}
