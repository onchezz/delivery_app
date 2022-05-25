// ignore_for_file: constant_identifier_names

class AppConstants {
  static const String APP_NAME = 'DBFOOD';

  static const int APP_VERSION = 1;

  static const String TOKEN = 'DBtoken';

  static const String BASE_URL = 'http://127.0.0.1:8000';
  // static const String BASE_URL = 'http://mvs.bslmeiyu.com';

  static const String POPULAR_PRODUCT_URI = '/api/v1/products/popular';

  static const String RECOMMENDED_PRODUCT_URI = '/api/v1/products/recommended';

  // static const String POPULAR_PRODUCT_URI = '/api/v1/products/products';
  static const String UPLOAD_URL = "/uploads/";

  // AUTH
  static const String REGISTARTION_URI = '/api/v1/auth/register';
  static const String LOGIN_URI = '/api/v1/auth/login';

  static const String Cart_List = "cart-list";
  static const String Cart_History_List = "cart-history-list";
}
