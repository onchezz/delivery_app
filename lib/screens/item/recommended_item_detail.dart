import 'package:delivery_app/controllers/popular_product_cotroller.dart';
import 'package:delivery_app/controllers/recomended_product.dart';
import 'package:delivery_app/routes/route_helper.dart';
import 'package:delivery_app/utils/app_constants.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/appicons.dart';
import 'package:delivery_app/widgets/expanded_text_widget.dart';
import 'package:delivery_app/widgets/text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommendedItemDetail extends StatelessWidget {
  final int pageId;

  const RecommendedItemDetail({Key? key, required this.pageId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecomendedProductController>().recomendedrProductList[pageId];
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: yellow2Color,
            toolbarHeight: Dimentions.h15 * 4.667,
            title: Container(
              margin: EdgeInsets.symmetric(vertical: Dimentions.h10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    icon: Icons.clear,
                    onTap: () {
                      Get.offAllNamed(RouteHelper.initial);
                    },
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            expandedHeight: 300,
            pinned: true,
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(Dimentions.h20 + 5),
                child: Container(
                  padding: EdgeInsets.only(
                      top: Dimentions.h10 / 2, bottom: Dimentions.h10),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimentions.h30),
                          topRight: Radius.circular(Dimentions.h30))),
                  child: Center(
                      child:
                          BigText(size: Dimentions.font26, text: product.name)),
                )),
            flexibleSpace: FlexibleSpaceBar(
                background: FancyShimmerImage(
              imageUrl:
                  AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img,
              boxFit: BoxFit.cover,
              width: double.maxFinite,
              height: double.maxFinite,
            )
                //  Image.network(
                //   AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img,
                //   fit: BoxFit.cover,
                //   width: double.maxFinite,
                // ),
                ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding:
                  EdgeInsets.only(left: Dimentions.w10, right: Dimentions.w10),
              child: ExpandedText(text: product.description),
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(
                left: Dimentions.w20 * 2.5,
                right: Dimentions.w20 * 2.5,
                top: Dimentions.h10,
                bottom: Dimentions.h10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  iconColor: Colors.white,
                  bgColor: main1Color,
                  iconSize: Dimentions.iconSize24,
                ),
                BigText(
                  text: '\$12.0 X  ' + '0',
                  size: Dimentions.font26,
                  color: mainBlackColor,
                ),
                AppIcon(
                  icon: Icons.add,
                  iconColor: Colors.white,
                  bgColor: main1Color,
                  iconSize: Dimentions.iconSize24,
                )
              ],
            ),
          ),
          Container(
            height: Dimentions.bottomBarh,
            padding: EdgeInsets.only(
                left: Dimentions.w20,
                right: Dimentions.w20,
                top: Dimentions.w20),
            decoration: BoxDecoration(
                color: buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimentions.h30),
                    topRight: Radius.circular(Dimentions.h30))),
            child: Padding(
              padding: EdgeInsets.only(bottom: Dimentions.h10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.only(
                          left: Dimentions.h20,
                          right: Dimentions.h20,
                          top: Dimentions.h20,
                          bottom: Dimentions.h20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Dimentions.h20),
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: main1Color,
                      )),
                  Container(
                      padding: EdgeInsets.only(
                          left: Dimentions.h20,
                          right: Dimentions.h20,
                          top: Dimentions.h20,
                          bottom: Dimentions.h20),
                      decoration: BoxDecoration(
                        color: main1Color,
                        borderRadius: BorderRadius.circular(Dimentions.h20),
                      ),
                      child: BigText(
                        text: "\$${product.price} Add to Cart ",
                        color: Colors.white,
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
