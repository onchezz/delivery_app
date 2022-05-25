import 'package:delivery_app/data/api/api_client.dart';
import 'package:delivery_app/models/login_model.dart';
import 'package:delivery_app/models/signup_model.dart';
import 'package:get/get_connect.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:delivery_app/utils/app_constants.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});
  Future<Response> registration(SignUp signUp) async {
    return await apiClient.postData(
        AppConstants.REGISTARTION_URI, signUp.toJson());
  }

  Future<Response> login(LoginModel loginModel) async {
    return await apiClient.postData(
        AppConstants.LOGIN_URI, loginModel.toJson());
  }

  saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }
}
