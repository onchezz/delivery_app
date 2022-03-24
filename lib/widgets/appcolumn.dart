import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/icon_text.dart';
import 'package:delivery_app/widgets/text.dart';
import 'package:flutter/material.dart';

class AppColumn extends StatelessWidget {
  final String text;
  final double size;
  const AppColumn({Key? key, required this.text, this.size = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: size,
        ),
        SizedBox(
          height: Dimentions.h10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                  (index) => const Icon(
                        Icons.star,
                        color: main1Color,
                        size: 15,
                      )),
            ),
            const SizedBox(
              width: 10,
            ),
            SmallText(text: "4.5"),
            const SizedBox(
              width: 10,
            ),
            SmallText(text: "1287"),
            const SizedBox(
              width: 10,
            ),
            SmallText(text: "comments"),
          ],
        ),
        SizedBox(
          height: Dimentions.h20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            IconText(
                icon: Icons.circle_sharp,
                text: 'Normal',
                iconColor: iconColor1),
            IconText(
                icon: Icons.location_on, text: '1.7km', iconColor: iconColor2),
            IconText(
                icon: Icons.access_alarm_rounded,
                text: '32 mins',
                iconColor: yellow1Color),
          ],
        )
      ],
    );
  }
}
