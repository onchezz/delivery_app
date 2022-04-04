import 'package:delivery_app/controllers/cart_controller.dart';
import 'package:delivery_app/utils/app_constants.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/appicons.dart';
import 'package:delivery_app/widgets/text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartHistoryPage extends StatelessWidget {
  const CartHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>().getCartHistoryList();
    Map<String, int> cartItemPerOrder = {};
    for (var i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemPerOrder.update(getCartHistoryList[i].time!, (v) => ++v);
//   print(getCartHistoryList[i]);
      } else {
        cartItemPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    List<int> cartOrderTimeToList() {
      return cartItemPerOrder.entries.map((e) => e.value).toList();
    }

    List<int> orderTimes = cartOrderTimeToList();

    var listCount = 0;
    return Scaffold(
      body: Column(children: [
        Container(
          padding: EdgeInsets.only(top: Dimentions.h20),
          color: main1Color,
          width: double.maxFinite,
          height: Dimentions.h20 * 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BigText(
                text: 'Cart Histoty',
                color: appWhite,
              ),
              SizedBox(
                width: Dimentions.w10 / 2,
              ),
              AppIcon(
                icon: CupertinoIcons.cart,
                bgColor: main1Color,
                iconColor: appWhite,
                iconSize: Dimentions.iconSize24 * 1.2,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
              margin: EdgeInsets.only(
                  top: Dimentions.h20,
                  left: Dimentions.h30,
                  right: Dimentions.h20),
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView(
                  children: [
                    for (var i = 0; i < cartItemPerOrder.length; i++)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(text: getCartHistoryList[i].time!),
                          Container(
                            margin: EdgeInsets.only(top: Dimentions.h10 / 2),
                            child: Row(
                              children: [
                                Container(
                                  width: Dimentions.h40 * 6.5,
                                  height: Dimentions.h20 * 5,
                                  child: ListView(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    children:
                                        List.generate(orderTimes[i], (index) {
                                      if (listCount <
                                          getCartHistoryList.length) {
                                        listCount++;
                                      }

                                      return Container(
                                        margin: EdgeInsets.only(
                                            bottom: Dimentions.h20,
                                            right: Dimentions.h20 / 2),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              Dimentions.h10),
                                          child: FancyShimmerImage(
                                              boxFit: BoxFit.cover,
                                              width: Dimentions.h20 * 4,
                                              height: Dimentions.h20 * 4,
                                              imageUrl: AppConstants.BASE_URL +
                                                  AppConstants.UPLOAD_URL +
                                                  getCartHistoryList[
                                                          listCount - 1]
                                                      .img!),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                                // Wrap(
                                //     spacing: Dimentions.h20 / 2,
                                //     direction: Axis.horizontal,
                                //     children:
                                //         List.generate(orderTimes[i], (index) {
                                //       if (listCount <
                                //           getCartHistoryList.length) {
                                //         listCount++;
                                //       }
                                //       return Container(
                                //         margin: EdgeInsets.only(
                                //           bottom: Dimentions.h20,
                                //           // right: Dimentions.h20 / 2
                                //         ),
                                //         child: ClipRRect(
                                //           borderRadius: BorderRadius.circular(
                                //               Dimentions.h10),
                                //           child: FancyShimmerImage(
                                //               boxFit: BoxFit.cover,
                                //               width: Dimentions.h20 * 4,
                                //               height: Dimentions.h20 * 4,
                                //               imageUrl: AppConstants.BASE_URL +
                                //                   AppConstants.UPLOAD_URL +
                                //                   getCartHistoryList[
                                //                           listCount - 1]
                                //                       .img!),
                                //         ),
                                //       );
                                //     }))
                              ],
                            ),
                          ),
                        ],
                      )
                  ],
                ),
              )),
        )
      ]),
    );
  }
}
