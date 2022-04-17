import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/appicons.dart';
import 'package:delivery_app/widgets/text.dart';
import 'package:flutter/material.dart';

class IconTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final VoidCallback? onTap;
  const IconTile(
      {Key? key,
      required this.icon,
      required this.text,
      this.color = main1Color,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: Dimentions.h10, horizontal: Dimentions.h10),
        padding: EdgeInsets.symmetric(
            vertical: Dimentions.h10, horizontal: Dimentions.h10),
        width: double.maxFinite,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimentions.h10),
            color: appWhite,
            boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                color: Colors.grey.shade500.withOpacity(0.2),
                blurRadius: 0,
                // offset: Offset(0, 3)
              )
            ]),
        child: Row(
          children: [
            AppIcon(
              icon: icon,
              bgColor: color,
              iconColor: Colors.white,
              size: Dimentions.h20 * 3,
              iconSize: Dimentions.h10 * 3,
            ),
            SizedBox(
              width: Dimentions.w20,
            ),
            SmallText(
              text: text,
              size: Dimentions.h20 + Dimentions.font10 / 3,
              color: mainBlackColor,
            )
          ],
        ),
      ),
    );
  }
}
