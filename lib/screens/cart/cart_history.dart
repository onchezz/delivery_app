import 'dart:convert';

import 'package:delivery_app/controllers/cart_controller.dart';
import 'package:delivery_app/models/cart_model.dart';
import 'package:delivery_app/utils/app_constants.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/appicons.dart';
import 'package:delivery_app/widgets/text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartHistoryPage extends StatelessWidget {
  const CartHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var date = DateFormat('MM/dd/yyyy hh:mm a').format(DateTime.now());
    var getCartHistoryList =
        Get.find<CartController>().getCartHistoryList().reversed.toList();
    Map<String, int> cartItemPerOrder = {};
    List itemsPerOrdes = [];

    for (var i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemPerOrder.update(getCartHistoryList[i].time!, (v) => ++v);
      } else {
        cartItemPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }
    for (var i = 0; i < getCartHistoryList.length; i++) {
      Map item = {};

      itemsPerOrdes.add(getCartHistoryList[i]);
    }
    print('items per ordes' + itemsPerOrdes.toString());
    print(cartItemPerOrder.entries);
    List<String> timePerOrders() {
      return cartItemPerOrder.entries.map((e) => e.key).toList();
    }

    List<int> cartOrdersPerTimeToList() {
      return cartItemPerOrder.entries.map((e) => e.value).toList();
    }

    List<String> timePerOrderCheout = timePerOrders();
    List<int> orderTimes = cartOrdersPerTimeToList();

    var listCounter = 0;
    var tmecount = 0;

    print(timePerOrderCheout);
    print(orderTimes);
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
                onTap: () {
                  Get.find<CartController>().clearCartHistort();
                },
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
                          // (() {
                          //  var date = DateFormat('MM/dd/yyyy hh:mm a').format(
                          //   //     DateTime.parse(getCartHistoryList[i].time!));
                          //   // var date = getCartHistoryList[tmecount].time!;
                          //   var date = timePerOrderCheout[i];
                          //   return BigText(text: date);
                          // }()),

                          BigText(text: timePerOrderCheout[i]),
                          Container(
                            margin: EdgeInsets.only(top: Dimentions.h10 / 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: Dimentions.h40 * 6.5,
                                  height: Dimentions.h20 * 5,
                                  child: ListView(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    children:
                                        List.generate(orderTimes[i], (index) {
                                      if (listCounter <
                                          getCartHistoryList.length) {
                                        listCounter++;
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
                                                          listCounter - 1]
                                                      .img!),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: Dimentions.h10 / 2),
                                    height: Dimentions.h20 * 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SmallText(
                                          text: 'Total',
                                          color: titleColor,
                                        ),
                                        BigText(
                                            color: titleColor,
                                            size: Dimentions.font16,
                                            text: orderTimes[i].toString() +
                                                (orderTimes[i] < 2
                                                    ? ' item'
                                                    : ' items')),
                                        GestureDetector(
                                          onTap: () {
                                            Map<int, CartModel> moreOrder = {};

                                            print('time per orders:' +
                                                timePerOrderCheout[i]
                                                    .toString());
                                            // for (var m = 0;
                                            //     m < getCartHistoryList.length;
                                            //     m++) {
                                            //   if (getCartHistoryList[m].time ==
                                            //       orderTime[j]) {
                                            //     moreOrder.putIfAbsent(
                                            //         getCartHistoryList[j].id!,
                                            //         () => CartModel.fromJson(
                                            //             jsonDecode(jsonEncode(
                                            //                 getCartHistoryList[
                                            //                     j]))));
                                            // }
                                            // }
                                            // Get.find<CartController>()
                                            //     .setItems = moreOrder;
                                            // Get.find<CartController>()
                                            //     .addToCartList();
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: Dimentions.h20 / 3,
                                                vertical: Dimentions.h10 / 3),
                                            height: Dimentions.h20,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimentions.h10 / 2),
                                              border: Border.all(
                                                  width: 1, color: main1Color),
                                            ),
                                            child: SmallText(
                                              text: 'Add More',
                                              color: main1Color,
                                              size: Dimentions.font10,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
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
