import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/text.dart';
import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;

  final Color iconColor;
  final double iconSize;
  final double textSize;
  const IconText(
      {Key? key,
      required this.icon,
      required this.text,
      required this.iconColor,
      this.iconSize = 0,
      this.textSize = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: iconSize == 0 ? Dimentions.iconSize24 : iconSize,
        ),
        SizedBox(
          width: Dimentions.w10 / 5,
        ),
        SmallText(
          text: text,
          size: textSize == 0 ? Dimentions.font16 : textSize,
        )
      ],
    );
  }
}
