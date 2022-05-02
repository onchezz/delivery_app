import 'package:flutter/material.dart';
import 'package:get/get.dart';

error(String errorMessage, {String title = 'Signup error'}) {
  return Get.snackbar(title, errorMessage,
      backgroundColor: Colors.redAccent, colorText: Colors.white);
}
