import 'package:delivery_app/data/api/api_client.dart';
import 'package:delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';

class RecomendedProductRepo extends GetxService {
  final ApiClient apiClient;
  RecomendedProductRepo({required this.apiClient});
  Future<Response> getRecomendedList() async {
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}
// '/api/v1/products/popular'
//  http://mvs.bslmeiyu.com/api/v1/products/popular