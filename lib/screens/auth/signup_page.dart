import 'package:delivery_app/screens/auth/login.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/app_buttons.dart';
import 'package:delivery_app/widgets/app_inputfield.dart';
import 'package:delivery_app/widgets/auth_services_icon.dart';
import 'package:delivery_app/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);
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
            AppInputField(
              controller: emailController,
              hintText: 'Email',
              prefixIcon: Icons.email,
              keyboardType: TextInputType.emailAddress,
            ),
            AppInputField(
              controller: usernameController,
              hintText: 'username',
              prefixIcon: Icons.person,
            ),
            AppInputField(
              controller: phoneController,
              hintText: 'phone',
              prefixIcon: Icons.phone_android,
              keyboardType: TextInputType.phone,
            ),
            AppInputField(
              controller: passwordController,
              hintText: 'password',
              prefixIcon: Icons.lock,
              suffixIcon: Icon(Icons.visibility),
            ),
            AppInputField(
              controller: confirmPasswordController,
              hintText: 'confirm password',
              prefixIcon: Icons.lock,
              suffixIcon: Icon(Icons.visibility),
            ),
            const AppButton(
              text: 'Sign Up',
            ),
            AppButtonText(
              onTap: () =>
                  Get.to(() => LoginPage(), transition: Transition.fade),
              text: 'Have an Account ?',
            ),
            SizedBox(
              height: Dimentions.h40,
            ),
            SmallText(
              text: 'Signup using one of the following Methods',
              color: Colors.grey.shade500,
            ),
            SizedBox(
              height: Dimentions.h15,
            ),
            Wrap(
              children: List.generate(
                images.length,
                (index) => AuthIcon(
                  onTap: () {
                    print(index);
                  },
                  imgPath: images[index],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
