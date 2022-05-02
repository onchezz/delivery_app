import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// Future customLoader(BuildContext context) {
//   return showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (_) {
//         return Dialog(
//           backgroundColor: main1Color,
//           child: Container(
//               height: Dimentions.h20 * 4,
//               width: Dimentions.h20 * 4,
//               child: loading()),
//         );
//       });
// }
Future customLoader(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return SizedBox(
            height: Dimentions.h20 * 4,
            width: Dimentions.h20 * 4,
            child: loading());
      });
}

Widget loading() {
  print("loading");
  return Center(
    child: SpinKitCircle(
      color: main1Color,
      size: Dimentions.h45,
    ),
  );
}
