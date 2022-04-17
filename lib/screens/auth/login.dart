import 'package:delivery_app/screens/auth/signup_page.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/app_buttons.dart';
import 'package:delivery_app/widgets/app_inputfield.dart';
import 'package:delivery_app/widgets/auth_services_icon.dart';
import 'package:delivery_app/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final List images = [
    'assets/image/g.png',
    'assets/image/t.png',
    'assets/image/f.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
              prefixIcon: Icons.phone_android,
              keyboardType: TextInputType.emailAddress,
            ),
            AppInputField(
              controller: passwordController,
              hintText: 'password',
              prefixIcon: Icons.lock,
              suffixIcon: Icon(Icons.visibility),
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
            const AppButton(
              text: 'LogIn',
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
                  onTap: () =>
                      Get.to(() => SignupPage(), transition: Transition.fade),
                  text: 'Create',
                  color: mainBlackColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
