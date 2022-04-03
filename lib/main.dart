import 'package:delivery_app/routes/route_helper.dart';
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
      ),
      // home: SplashScreen(),
      initialRoute: RouteHelper.getSplashPage(),
      getPages: RouteHelper.routes,
    );
    //     });
    //   });
    // });
    // home: const HomeScreen());
  }
}


// Get.find<PopularProductController>().getPopularProductList();
    // Get.find<RecomendedProductController>().getRecomendedProductList();
    // Get.find<CartController>();

    // return GetBuilder<PopularProductController>(builder: (popular) {
    //   return GetBuilder<RecomendedProductController>(builder: (recommended) {
    //     return GetBuilder<CartController>(builder: (cartController) {