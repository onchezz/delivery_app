import 'package:delivery_app/screens/Home/homepage.dart';
import 'package:delivery_app/screens/item/popular_item.dart';
import 'package:delivery_app/screens/item/recommended_item_detail.dart';
import 'package:get/route_manager.dart';

class RouteHelper {
  //
  static const String initial = '/';
  static const String popularPage = '/popular-item';
  static const String recommendedPage = '/recommended-item';

  //
  static String getInitial() => "$initial";
  static String getPouplarPage(int pageId) => '$popularPage?pageId=$pageId';
  static String getrecommendedPage(int pageId) =>
      '$recommendedPage?pageId=$pageId';

  //list of pages
  static List<GetPage> routes = [
    GetPage(name: initial, page: () => HomeScreen()),
    GetPage(
        name: popularPage,
        page: () {
          var pageId = Get.parameters['pageId'];
          return PopularItem(pageId: int.parse(pageId!));
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedPage,
        page: () {
          var pageId = Get.parameters['pageId'];
          return RecommendedItemDetail(pageId: int.parse(pageId!));
        },
        transition: Transition.fadeIn),
  ];
}
