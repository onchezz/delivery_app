import 'package:delivery_app/routes/route_helper.dart';
import 'package:delivery_app/screens/auth/login.dart';
import 'package:delivery_app/screens/auth/signup_page.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'helper/dependencies/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Delivery app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            color: main1Color,
            elevation: 0,
          )),
      home: SignupPage(),
      // initialRoute: RouteHelper.getSplashPage(),
      getPages: RouteHelper.routes,
    );
    //     });
    //   });
    // });
  }
}


// Get.find<PopularProductController>().getPopularProductList();
    // Get.find<RecomendedProductController>().getRecomendedProductList();
    // Get.find<CartController>();

    // return GetBuilder<PopularProductController>(builder: (popular) {
    //   return GetBuilder<RecomendedProductController>(builder: (recommended) {
    //     return GetBuilder<CartController>(builder: (cartController) {