// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:delivery_app/controllers/popular_product_cotroller.dart';
import 'package:delivery_app/controllers/recomended_product.dart';
import 'package:delivery_app/models/product.dart';
import 'package:delivery_app/routes/route_helper.dart';
import 'package:delivery_app/utils/app_constants.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/appcolumn.dart';
import 'package:delivery_app/widgets/icon_text.dart';
import 'package:delivery_app/widgets/text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class PageViewBody extends StatefulWidget {
  const PageViewBody({Key? key}) : super(key: key);

  @override
  State<PageViewBody> createState() => _PageViewBodyState();
}

class _PageViewBodyState extends State<PageViewBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double scaleFactor = 0.8;
  double height = Dimentions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
      // print("current page  ${_currentPageValue.toString()}");
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<PopularProductController>(
          builder: (popularProducts) {
            return popularProducts.isLoaded
                ? Container(
                    color: Colors.transparent,
                    height: Dimentions.pageView,
                    child: PageView.builder(
                        controller: pageController,
                        itemCount: popularProducts.popularProductList.length,
                        itemBuilder: (context, position) {
                          return _buildPageItem(position,
                              popularProducts.popularProductList[position]);
                        }),
                  )
                : Container(
                    height: Dimentions.pageView,
                    child: SpinKitFadingCircle(
                      color: main1Color,
                      size: Dimentions.h45,
                    ),
                  );
          },
        ),
        GetBuilder<PopularProductController>(
          builder: (popularProducts) {
            return DotsIndicator(
              dotsCount: popularProducts.popularProductList.isEmpty
                  ? 2
                  : popularProducts.popularProductList.length,
              position: _currentPageValue,
              decorator: DotsDecorator(
                activeColor: main1Color,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            );
          },
        ),
        //populat text
        Container(
            margin: EdgeInsets.only(left: Dimentions.w30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BigText(text: 'Recommended'),
                SizedBox(
                  width: Dimentions.w10,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  child: BigText(
                    text: '.',
                    color: Colors.black26,
                  ),
                ),
                SizedBox(
                  width: Dimentions.w10,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  child: SmallText(text: 'Food Pairing'),
                ),
                SizedBox(
                  height: Dimentions.h20,
                ),
              ],
            )),
        GetBuilder<RecomendedProductController>(
          builder: (recommendedProducts) {
            return recommendedProducts.isLoaded
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        recommendedProducts.recomendedrProductList.length,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () =>
                            Get.toNamed(RouteHelper.getrecommendedPage(index)),
                        child: Container(
                          margin: EdgeInsets.only(
                              left: Dimentions.w20,
                              right: Dimentions.w20,
                              bottom: Dimentions.h10),
                          child: Row(
                            children: [
                              //image container
                              Container(
                                height: Dimentions.listViewImg,
                                width: Dimentions.listViewImg,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimentions.radius20),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(AppConstants.BASE_URL +
                                        AppConstants.UPLOAD_URL +
                                        recommendedProducts
                                            .recomendedrProductList[index]
                                            .img!),
                                  ),
                                ),
                              ),
                              //text container
                              Expanded(
                                  child: Container(
                                height: Dimentions.listViewTextContainer,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight:
                                        Radius.circular(Dimentions.radius20),
                                    bottomRight:
                                        Radius.circular(Dimentions.radius20),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: Dimentions.w10,
                                      right: Dimentions.w10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      BigText(
                                          text: recommendedProducts
                                              .recomendedrProductList[index]
                                              .name),
                                      SizedBox(
                                        height: Dimentions.h10 / 2,
                                      ),
                                      SmallText(
                                          overflow: TextOverflow.ellipsis,
                                          maxLine: 2,
                                          size: Dimentions.font16,
                                          text: recommendedProducts
                                              .recomendedrProductList[index]
                                              .description),
                                      SizedBox(
                                        height: Dimentions.h10 / 2,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          IconText(
                                              icon: Icons.circle_sharp,
                                              text: 'Normal',
                                              iconColor: iconColor1),
                                          IconText(
                                              icon: Icons.location_on,
                                              text: '1.7km',
                                              iconColor: main1Color),
                                          IconText(
                                              icon: Icons.access_alarm_rounded,
                                              text: '32 mins',
                                              iconColor: yellow1Color),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ))
                            ],
                          ),
                        ),
                      );
                    })
                : SizedBox(
                    height: Dimentions.pageView,
                    child: SpinKitFadingCircle(
                      color: main1Color,
                      size: Dimentions.h45,
                    ),
                  );
          },
        )
      ],
    );
  }

  Widget _buildPageItem(int index, ProductsModel popularProduct) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          scaleFactor + (_currentPageValue - index + 1) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, height * (1 - currScale) / 2, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimentions.pageViewContainer,
            margin:
                EdgeInsets.only(left: Dimentions.w10, right: Dimentions.w10),
            decoration: BoxDecoration(
              color: index.isEven
                  ? const Color(0xFF69c5fdf)
                  : const Color(0xff92944cc),
              borderRadius: BorderRadius.circular(Dimentions.radius30),
              // image: DecorationImage(
              //   fit: BoxFit.cover,
              //   image: NetworkImage(AppConstants.BASE_URL +
              //       AppConstants.UPLOAD_URL +
              //       popularProduct.img!),
              // ),
            ),
            child: GestureDetector(
              onTap: (() => Get.toNamed(RouteHelper.getPouplarPage(index))),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(Dimentions.radius30),
                  child: FancyShimmerImage(
                    boxFit: BoxFit.cover,
                    height: Dimentions.pageViewContainer,
                    width: double.infinity,
                    imageUrl: AppConstants.BASE_URL +
                        AppConstants.UPLOAD_URL +
                        popularProduct.img!,
                  )),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: Dimentions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimentions.w20,
                  right: Dimentions.w20,
                  bottom: Dimentions.h30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimentions.radius20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5,
                        offset: Offset(0, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(0, 5)),
                  ]),
              child: Container(
                  padding: EdgeInsets.only(
                      top: Dimentions.h10,
                      left: Dimentions.w15,
                      right: Dimentions.w15),
                  child: AppColumn(
                    text: popularProduct.name!,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
