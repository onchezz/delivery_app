import 'package:delivery_app/data/repository/auth_repo.dart';
import 'package:delivery_app/models/login_model.dart';
import 'package:delivery_app/models/signup_model.dart';
import 'package:delivery_app/models/response_model.dart';

import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});
  bool _isLoading = false;
  get isLoading => _isLoading;

  Future<ResponseModel> register(SignUp signUp) async {
    _isLoading = true;
    update();
    Response response = await authRepo.registration(signUp);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body["token"]);
      responseModel =
          ResponseModel(isSuccess: true, messege: response.body["token"]);
    } else {
      responseModel =
          ResponseModel(isSuccess: true, messege: response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future login(LoginModel login) async {
    Response response = await authRepo.login(login);
    _isLoading = true;
    if (response.statusCode == 200) {
    } else {}
    _isLoading = false;
  }
}
