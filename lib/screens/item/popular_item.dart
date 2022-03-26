import 'package:delivery_app/controllers/cart_controller.dart';
import 'package:delivery_app/controllers/popular_product_cotroller.dart';
import 'package:delivery_app/routes/route_helper.dart';
import 'package:delivery_app/utils/app_constants.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/appcolumn.dart';
import 'package:delivery_app/widgets/appicons.dart';
import 'package:delivery_app/widgets/expanded_text_widget.dart';
import 'package:delivery_app/widgets/icon_text.dart';
import 'package:delivery_app/widgets/text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularItem extends StatelessWidget {
  final int pageId;
  const PopularItem({required this.pageId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];

    Get.find<PopularProductController>()
        .initProduct(Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Positioned(
          left: 0,
          right: 0,
          child: FancyShimmerImage(
            width: double.maxFinite,
            height: Dimentions.popularItemImg,
            imageUrl:
                AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img!,
            boxFit: BoxFit.cover,
          ),
        ),
        Positioned(
            top: Dimentions.h45,
            left: Dimentions.w20,
            right: Dimentions.w20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  onTap: () => Get.back(),
                ),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            )),
        Positioned(
            top: Dimentions.popularItemImg - 20,
            left: 0,
            right: 0,
            child: Container(
                height: Dimentions.popularItemText,
                padding: EdgeInsets.only(
                    left: Dimentions.w20,
                    right: Dimentions.w20,
                    top: Dimentions.w20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimentions.h20),
                        topRight: Radius.circular(Dimentions.h20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(
                      text: product.name,
                      size: Dimentions.font26,
                    ),
                    SizedBox(
                      height: Dimentions.h20,
                    ),
                    BigText(text: 'Introduction'),
                    SizedBox(height: Dimentions.h10),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: ExpandedText(text: product.description),
                      ),
                    )
                  ],
                )))
      ]),
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (pupularProduct) {
        return Container(
          height: Dimentions.bottomBarh,
          padding: EdgeInsets.only(
              left: Dimentions.w20, right: Dimentions.w20, top: Dimentions.w20),
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
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            pupularProduct.setQuantity(false);
                          },
                          child: const Icon(Icons.remove, color: signColor)),
                      SizedBox(
                        width: Dimentions.w10 / 2,
                      ),
                      BigText(text: pupularProduct.quantity.toString()),
                      SizedBox(
                        width: Dimentions.w10 / 2,
                      ),
                      GestureDetector(
                          onTap: () {
                            pupularProduct.setQuantity(true);
                          },
                          child: const Icon(
                            Icons.add,
                            color: signColor,
                          )),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    pupularProduct.addItem(product);
                  },
                  child: Container(
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
                        text: "\$ ${product.price} |Add to Cart ",
                        color: Colors.white,
                      )),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
