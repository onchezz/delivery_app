import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:flutter/material.dart';

class AppInputField extends StatelessWidget {
  const AppInputField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.prefixIcon,
      this.validate,
      this.suffixIcon,
      this.obscureText = false,
      this.keyboardType})
      : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final FormFieldValidator<String>? validate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: Dimentions.h10, vertical: Dimentions.h10),
      padding: EdgeInsets.symmetric(
          horizontal: Dimentions.h10, vertical: Dimentions.h10 / 2),
      decoration: BoxDecoration(
          color: appWhite,
          borderRadius: BorderRadius.circular(Dimentions.h30),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                spreadRadius: 1,
                color: Colors.grey.withOpacity(0.3),
                offset: const Offset(1, 5))
          ]),
      child: TextFormField(
        validator: validate,
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obscureText,
        cursorColor: main1Color,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(fontSize: Dimentions.font20),
        decoration: InputDecoration(
            // label: Text('Email'),
            hintText: hintText,
            hintStyle: TextStyle(fontSize: Dimentions.font20),
            border: InputBorder.none,
            errorStyle: TextStyle(fontSize: Dimentions.font10),
            prefixIcon: Icon(
              prefixIcon,
              color: yellow1Color,
            ),
            suffixIcon: suffixIcon),
      ),
    );
  }
}
