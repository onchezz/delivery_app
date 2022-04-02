import 'package:delivery_app/screens/Home/homepage.dart';
import 'package:delivery_app/screens/cart/cart_page.dart';
import 'package:delivery_app/screens/item/popular_item.dart';
import 'package:delivery_app/screens/item/recommended_item_detail.dart';
import 'package:delivery_app/screens/main/main_page.dart';
import 'package:delivery_app/screens/splash/splash_screen.dart';
import 'package:get/route_manager.dart';

class RouteHelper {
  //
  static const String splashPage = '/splash-page';
  static const String initial = '/';
  static const String popularPage = '/popular-item';
  static const String recommendedPage = '/recommended-item';
  static const String cartPage = '/cart-page';
  //

  static String getSplashPage() => splashPage;
  static String getInitial() => initial;
  static String getPouplarPage(int pageId, String page) =>
      '$popularPage?pageId=$pageId&page=$page';
  static String getrecommendedPage(int pageId, String page) =>
      '$recommendedPage?pageId=$pageId&page=$page';
  static String getCartPage() => "$cartPage";
  //list of pages
  static List<GetPage> routes = [
    GetPage(
        name: splashPage,
        page: () => const SplashScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: initial,
        page: () => const MainPage(),
        transition: Transition.size),
    GetPage(
        name: popularPage,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return PopularItem(page: page!, pageId: int.parse(pageId!));
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedPage,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return RecommendedItemDetail(
              page: page!,
              pageId: int.parse(
                pageId!,
              ));
        },
        transition: Transition.fadeIn),
    GetPage(
        name: cartPage,
        page: () {
          return const CartPage();
        },
        transition: Transition.fadeIn),
  ];
}
