import 'package:delivery_app/controllers/auth_controller.dart';
import 'package:delivery_app/models/login_model.dart';
import 'package:delivery_app/models/signup_model.dart';
import 'package:delivery_app/screens/auth/signup_page.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/app_buttons.dart';
import 'package:delivery_app/widgets/app_inputfield.dart';
import 'package:delivery_app/widgets/auth_services_icon.dart';
import 'package:delivery_app/widgets/error_widget.dart';
import 'package:delivery_app/widgets/loading_spinner.dart';
import 'package:delivery_app/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  final usernameController = TextEditingController();

  final phoneController = TextEditingController();

  final passwordController = TextEditingController();

  final List images = [
    'assets/image/g.png',
    'assets/image/t.png',
    'assets/image/f.png'
  ];

  _login(
    AuthController auth,
  ) {
    String email = emailController.text.trim();

    // String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    LoginModel login = LoginModel(email: email, password: password);

    customLoader(context);
    auth.login(login).then((status) {
      if (status.isSuccess) {
        error('all went well');
        print('registration successful');
      } else {
        error(status.messege);
      }
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (auth) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: Dimentions.h20 * 2, bottom: Dimentions.h10 / 2),
                  child: Center(
                    child: CircleAvatar(
                        radius: Dimentions.screenh * 0.09,
                        backgroundColor: Colors.white,
                        backgroundImage:
                            const AssetImage('assets/image/logo part 1.png')),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(
                    horizontal: Dimentions.h10 / 5,
                  ),
                  child: Column(
                    children: [
                      BigText(
                        text: 'Hello',
                        size: Dimentions.h20 * 4,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: Dimentions.h30),
                        child: BigText(
                          text: 'Login into your Acount ',
                          color: Colors.grey.shade500,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: Dimentions.h20 * 2,
                ),
                AppInputField(
                  controller: emailController,
                  hintText: 'Email',
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validate: (email) {
                    if (email!.isEmpty) {
                      return 'enter your email';
                    } else if (!GetUtils.isEmail(email)) {
                      return 'enter correct email';
                    }
                    return null;
                  },
                ),
                AppInputField(
                  controller: passwordController,
                  hintText: 'password',
                  prefixIcon: Icons.lock_outline,
                  suffixIcon: const Icon(Icons.visibility),
                  validate: (pass) {
                    if (pass!.isEmpty || pass.length < 6) {
                      return "     password is less than 6";
                    }
                    return null;
                  },
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(
                      horizontal: Dimentions.h10, vertical: Dimentions.h10),
                  child: AppButtonText(
                    text: 'Forgot Password?',
                    fontSize: Dimentions.font16,
                  ),
                ),
                SizedBox(
                  height: Dimentions.h20 * 5,
                ),
                AppButton(
                  text: !auth.isLoading ? 'LogIn' : "please wait ...",
                  tap: () {
                    if (_formKey.currentState!.validate()) {
                      _login(auth);
                    }
                  },
                ),
                SizedBox(
                  height: Dimentions.h20 * 1.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BigText(
                        text: 'Don\'t have an account?',
                        color: Colors.grey.shade500),
                    SizedBox(
                      width: Dimentions.h10 / 2,
                    ),
                    AppButtonText(
                      onTap: () => Get.to(() => SignupPage(),
                          transition: Transition.fade),
                      text: 'Create',
                      color: mainBlackColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
