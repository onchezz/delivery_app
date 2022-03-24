// ignore_for_file: must_be_immutable

import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  Color color;
  double size;
  TextOverflow overflow;

  BigText(
      {Key? key,
      required this.text,
      this.color = mainBlackColor,
      this.overflow = TextOverflow.ellipsis,
      this.size = 0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: 1,
      style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: size == 0 ? Dimentions.font20 : size,
          color: color),
    );
  }
}

class SmallText extends StatelessWidget {
  final String text;
  Color color;
  double size;
  double height;
  int? maxLine;
  TextOverflow? overflow;
  SmallText(
      {Key? key,
      required this.text,
      this.color = textColor,
      this.height = 1.2,
      this.maxLine,
      this.overflow,
      this.size = 16})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,
      overflow: overflow,
      style: TextStyle(
          fontFamily: 'Roboto', height: 1.2, fontSize: size, color: color),
    );
  }
}
