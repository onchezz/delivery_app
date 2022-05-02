import 'package:delivery_app/controllers/auth_controller.dart';
import 'package:delivery_app/models/auth_model.dart';
import 'package:delivery_app/screens/auth/login.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/app_buttons.dart';
import 'package:delivery_app/widgets/app_inputfield.dart';
import 'package:delivery_app/widgets/auth_services_icon.dart';
import 'package:delivery_app/widgets/error_widget.dart';
import 'package:delivery_app/widgets/loading_spinner.dart';
import 'package:delivery_app/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final List images = [
    'assets/image/g.png',
    'assets/image/t.png',
    'assets/image/f.png'
  ];

  bool isVisible = true;

  void visible() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  // _signup(AuthController auth) {
  //   String email = emailController.text.trim();
  //   String name = nameController.text.trim();
  //   String phone = phoneController.text.trim();
  //   String password = passwordController.text.trim();
  //   String confirmPassword = confirmPasswordController.text.trim();
  //   if (email.isEmpty) {
  //     error('enter your email');
  //   } else if (!GetUtils.isEmail(email)) {
  //     error('enter correct email');
  //   } else if (name.isEmpty) {
  //     error('enter your name');
  //   } else if (phone.isEmpty) {
  //     error('enter phone number');
  //   } else if (password.length < 6) {
  //     error('password should be greater than 6 characters');
  //   } else if (password != confirmPassword) {
  //     error('passwords dont match');
  //   } else {
  //     SignUp _signupBody =
  //         SignUp(email: email, name: name, phone: phone, password: password);

  //     customLoader(context);
  //     auth.register(_signupBody).then((status) {
  //       if (status.isSuccess) {
  //         error('all went well');
  //         print('registration successful');
  //       } else {
  //         error(status.messege);
  //       }
  //       Navigator.of(context).pop();
  //     });
  //   }
  // }

  _signup(AuthController auth) {
    String email = emailController.text.trim();
    String name = nameController.text.trim();
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();

    SignUp _signupBody =
        SignUp(email: email, name: name, phone: phone, password: password);

    customLoader(context);
    auth.register(_signupBody).then((status) {
      if (status.isSuccess) {
        error('all went well');
        print('registration successful');
      } else {
        error(status.messege);
      }
      Navigator.of(context).pop();
    });
  }

  _validate() {
    _formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (auth) {
        return SingleChildScrollView(
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
                AppInputField(
                  controller: emailController,
                  hintText: 'Email',
                  prefixIcon: Icons.email,
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
                  controller: nameController,
                  hintText: 'Name',
                  prefixIcon: Icons.person,
                  validate: (name) {
                    if (name!.isEmpty) {
                      return '       enter your email';
                    }
                    return null;
                  },
                ),
                AppInputField(
                  controller: phoneController,
                  hintText: 'phone',
                  prefixIcon: Icons.phone_android,
                  keyboardType: TextInputType.phone,
                  validate: (phone) {
                    if (phone!.isEmpty) {
                      return 'enter your email';
                    } else if (!GetUtils.isPhoneNumber(phone)) {
                      return 'enter correct Phone Number';
                    }
                    return null;
                  },
                ),
                AppInputField(
                  validate: (pass) {
                    if (pass!.length < 6) {
                      return 'enter correct email';
                    }
                    return null;
                  },
                  obscureText: isVisible,
                  controller: passwordController,
                  hintText: 'password',
                  prefixIcon: Icons.lock,
                  suffixIcon: GestureDetector(
                    onTap: visible,
                    child: Icon(
                        isVisible ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
                AppInputField(
                  validate: (pass) {
                    if (pass!.length < 6 || pass != passwordController.text) {
                      return 'passwords doesnt match';
                    }
                    return null;
                  },
                  obscureText: isVisible,
                  controller: confirmPasswordController,
                  hintText: 'confirm password',
                  prefixIcon: Icons.lock,
                  suffixIcon: GestureDetector(
                    onTap: visible,
                    child: Icon(
                        isVisible ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
                AppButton(
                  text: !auth.isLoading ? 'Sign Up' : "please wait ...",
                  tap: () async {
                    _validate().then({_signup(auth)});
                  },
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
      }),
    );
  }
}
