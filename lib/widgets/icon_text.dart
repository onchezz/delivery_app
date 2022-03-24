import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/text.dart';
import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;

  final Color iconColor;

  const IconText(
      {Key? key,
      required this.icon,
      required this.text,
      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Dimentions.iconSize24,
        ),
        const SizedBox(
          width: 2,
        ),
        SmallText(
          text: text,
          size: 14,
        )
      ],
    );
  }
}
