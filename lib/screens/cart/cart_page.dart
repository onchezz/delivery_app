import 'package:delivery_app/controllers/cart_controller.dart';
import 'package:delivery_app/controllers/popular_product_cotroller.dart';
import 'package:delivery_app/controllers/recomended_product.dart';
import 'package:delivery_app/data/repository/cart_repo.dart';
import 'package:delivery_app/routes/route_helper.dart';
import 'package:delivery_app/screens/cart/empty_cart.dart';
import 'package:delivery_app/screens/item/recommended_item_detail.dart';
import 'package:delivery_app/utils/app_constants.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/appicons.dart';
import 'package:delivery_app/widgets/text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      body: Stack(
        children: [
          Positioned(
              top: Dimentions.h45,
              right: Dimentions.w20,
              left: Dimentions.w20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: main1Color,
                    iconSize: Dimentions.iconSize24,
                    bgColor: appWhite,
                    onTap: () {
                      Get.back(canPop: false);
                    },
                  ),
                  SizedBox(
                    width: Dimentions.w20 * 5,
                  ),
                  AppIcon(
                    icon: Icons.home,
                    iconColor: appWhite,
                    iconSize: Dimentions.iconSize24,
                    bgColor: main1Color,
                    onTap: () {
                      Get.toNamed(RouteHelper.initial);
                    },
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart_rounded,
                    iconColor: appWhite,
                    iconSize: Dimentions.iconSize24,
                    bgColor: main1Color,
                    onTap: () {},
                  ),
                ],
              )),
          Positioned(
              top: Dimentions.w20 * 5,
              right: Dimentions.w20,
              left: Dimentions.w20,
              bottom: 0,
              child: GetBuilder<CartController>(builder: (cartController) {
                var _cartList = cartController.getCartItems;
                return _cartList.isNotEmpty
                    ? Container(
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView.builder(
                            itemCount: _cartList.length,
                            itemBuilder: (_, index) {
                              return Container(
                                margin: EdgeInsets.only(bottom: Dimentions.h10),
                                child: Row(children: [
                                  GestureDetector(
                                    onTap: () {
                                      var popularindex =
                                          Get.find<PopularProductController>()
                                              .popularProductList
                                              .indexOf(
                                                  _cartList[index].product);

                                      if (popularindex >= 0) {
                                        Get.toNamed(RouteHelper.getPouplarPage(
                                            popularindex, "cart"));
                                      } else {
                                        var recomendedIndex = Get.find<
                                                RecomendedProductController>()
                                            .recomendedrProductList
                                            .indexOf(_cartList[index].product);
                                        if (recomendedIndex <= 0) {
                                          Get.snackbar('CartHistory',
                                              ' items added from cartHistroy',
                                              backgroundColor: main1Color,
                                              colorText: appWhite,
                                              duration:
                                                  Duration(milliseconds: 700));
                                        } else {
                                          if (recomendedIndex >= 0) {
                                            Get.toNamed(
                                                RouteHelper.getrecommendedPage(
                                                    recomendedIndex, 'cart'));
                                          }
                                        }
                                      }
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          Dimentions.radius20),
                                      child: FancyShimmerImage(
                                          shimmerBaseColor: Colors.white,
                                          boxFit: BoxFit.cover,
                                          height: Dimentions.h20 * 5,
                                          width: Dimentions.h20 * 5,
                                          imageUrl: AppConstants.BASE_URL +
                                              AppConstants.UPLOAD_URL +
                                              cartController
                                                  .getCartItems[index].img!),
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                    padding:
                                        EdgeInsets.only(left: Dimentions.h10),
                                    height: Dimentions.h20 * 5,
                                    // color: Colors.white,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        BigText(
                                          text: cartController
                                              .getCartItems[index].name!,
                                          color: Colors.black54,
                                        ),
                                        SmallText(text: 'likes'),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            BigText(
                                                text:
                                                    '\$ ${cartController.getCartItems[index].price}'),
                                            Container(
                                              padding: EdgeInsets.all(
                                                  Dimentions.h10),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimentions.h10),
                                              ),
                                              child: Row(
                                                children: [
                                                  GestureDetector(
                                                      onTap: () {
                                                        cartController.addItem(
                                                            _cartList[index]
                                                                .product!,
                                                            -1);
                                                      },
                                                      child: const Icon(
                                                          Icons.remove,
                                                          color: signColor)),
                                                  SizedBox(
                                                    width: Dimentions.w10 / 2,
                                                  ),
                                                  BigText(
                                                      text: _cartList[index]
                                                          .quantity!
                                                          .toString()),
                                                  SizedBox(
                                                    width: Dimentions.w10 / 2,
                                                  ),
                                                  GestureDetector(
                                                      onTap: () {
                                                        cartController.addItem(
                                                            _cartList[index]
                                                                .product!,
                                                            1);
                                                      },
                                                      child: const Icon(
                                                        Icons.add,
                                                        color: signColor,
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )),
                                ]),
                              );
                            },
                          ),
                        ),
                      )
                    : const NoItems(text: 'no items in cart');
              }))

          //
        ],
      ),
      bottomNavigationBar:
          GetBuilder<CartController>(builder: (cartController) {
        return cartController.getCartItems.isNotEmpty
            ? Container(
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
                          child: BigText(
                            text: '\$' + cartController.totalAmount.toString(),
                            color: mainBlackColor.withOpacity(0.8),
                          )),
                      GestureDetector(
                        onTap: () {
                          cartController.addToCartHistory();
                        },
                        child: Container(
                            padding: EdgeInsets.only(
                                left: Dimentions.h20,
                                right: Dimentions.h20,
                                top: Dimentions.h20,
                                bottom: Dimentions.h20),
                            decoration: BoxDecoration(
                              color: main1Color,
                              borderRadius:
                                  BorderRadius.circular(Dimentions.h20),
                            ),
                            child: BigText(
                              text: " Check Out ",
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                ))
            : Container(
                height: Dimentions.bottomBarh,
              );
      }),
    );
  }
}
