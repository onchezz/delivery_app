import 'package:flutter/material.dart';

class NoItems extends StatelessWidget {
  final String text;
  final String imgPath;

  const NoItems(
      {Key? key,
      required this.text,
      this.imgPath = "assets/image/empty_cart.png"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          imgPath,
          height: h * 0.32,
          width: w * 0.22,
        ),
        const SizedBox(
          height: 0.03,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: h * 0.0174, color: Theme.of(context).disabledColor),
        )
      ],
    );
  }
}
