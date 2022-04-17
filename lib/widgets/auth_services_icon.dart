import 'package:delivery_app/utils/dimensions.dart';
import 'package:flutter/material.dart';

class AuthIcon extends StatelessWidget {
  final String imgPath;
  final VoidCallback? onTap;
  const AuthIcon({
    Key? key,
    required this.imgPath,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: Dimentions.h10 / 2),
        child: CircleAvatar(
          radius: Dimentions.h20 + Dimentions.h10 / 2,
          backgroundImage: AssetImage(imgPath),
        ),
      ),
    );
  }
}
