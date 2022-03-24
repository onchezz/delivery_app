import 'package:delivery_app/utils/dimensions.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  final double size;
  final double iconSize;

  final VoidCallback? onTap;
  const AppIcon(
      {Key? key,
      required this.icon,
      this.bgColor = const Color(0xFFfcf4ef),
      this.size = 40,
      this.iconColor = const Color(0xFF756d54),
      this.iconSize = 16,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(size / 2)),
        child: Icon(
          icon,
          size: iconSize == 16 ? Dimentions.iconSize16 : iconSize,
          color: iconColor,
        ),
      ),
    );
  }
}
