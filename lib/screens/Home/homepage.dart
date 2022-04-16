import 'package:delivery_app/controllers/popular_product_cotroller.dart';
import 'package:delivery_app/controllers/recomended_product.dart';
import 'package:delivery_app/screens/Home/pageview_body.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _reload() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecomendedProductController>().getRecomendedProductList();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        color: main1Color,
        child: Column(
          children: [
            //app bar container
            Container(
              margin:
                  EdgeInsets.only(top: Dimentions.h45, bottom: Dimentions.h15),
              padding:
                  EdgeInsets.only(left: Dimentions.w20, right: Dimentions.w20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: 'Bangladesh', color: main1Color),
                      Row(
                        children: [
                          SmallText(
                            text: 'city',
                          ),
                          GestureDetector(
                              onTap: _reload,
                              child: const Icon(Icons.arrow_drop_down_rounded))
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: Dimentions.h45,
                    height: Dimentions.h45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimentions.radius15),
                      color: main1Color,
                    ),
                    child: Center(
                        child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: Dimentions.iconSize24,
                    )),
                  )
                ],
              ),
            ),
            //corousel image

            const Expanded(child: SingleChildScrollView(child: PageViewBody())),
          ],
        ),
        onRefresh: _reload);
  }
}
