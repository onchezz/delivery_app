import 'package:delivery_app/screens/Home/pageview_body.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                        const Icon(Icons.arrow_drop_down_rounded)
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
    );
  }
}
