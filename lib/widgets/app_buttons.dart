import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  const AppButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimentions.screenw / 2,
      margin: EdgeInsets.symmetric(
        vertical: Dimentions.h10,
      ),
      padding: EdgeInsets.symmetric(
          vertical: Dimentions.h15, horizontal: Dimentions.h40),
      decoration: BoxDecoration(
          color: main1Color,
          borderRadius: BorderRadius.circular(Dimentions.h30)),
      child: Center(
        child: BigText(
          text: text,
          color: appWhite,
          size: Dimentions.font26,
        ),
      ),
    );
  }
}

class AppButtonText extends StatelessWidget {
  final String text;
  final double fontSize;
  final VoidCallback? onTap;
  final Color color;
  const AppButtonText(
      {Key? key,
      this.onTap,
      required this.text,
      this.color = Colors.grey,
      this.fontSize = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
        recognizer: TapGestureRecognizer()..onTap = onTap,
        text: text,
        style: TextStyle(
            color: color,
            fontSize: fontSize == 20 ? Dimentions.font20 : fontSize)));
  }
}
