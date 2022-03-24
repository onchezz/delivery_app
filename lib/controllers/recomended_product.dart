import 'package:delivery_app/data/repository/recomended_repo.dart';
import 'package:delivery_app/models/product.dart';
import 'package:get/get.dart';

class RecomendedProductController extends GetxController {
  final RecomendedProductRepo recomendedProductRepo;
  RecomendedProductController({required this.recomendedProductRepo});

  List<dynamic> _recomendedProductList = [];
  List<dynamic> get recomendedrProductList => _recomendedProductList;

  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;
  Future<void> getRecomendedProductList() async {
    Response response = await recomendedProductRepo.getRecomendedList();

    if (response.statusCode == 200) {
      print(' recomended got products');
      _isLoaded = true;
      _recomendedProductList = [];
      _recomendedProductList.addAll(Product.fromJson(response.body).products);
      update();
    } else {
      print('failed to get recomended products');
    }
  }
}
