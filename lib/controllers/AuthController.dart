import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum AuthType { signIn, signUp }

class AuthController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  final Rx<bool> isLogged = Rx<bool>(false);

  final Rx<bool> isShowPassword = Rx<bool>(false);

  final Rx<AuthType?> authType = Rx<AuthType?>(null);

  final Rx<TextEditingController> emailController =
      Rx<TextEditingController>(TextEditingController());
  final Rx<TextEditingController> passwordController =
      Rx<TextEditingController>(TextEditingController());

  final Rx<TextEditingController> nameController =
      Rx<TextEditingController>(TextEditingController());
}
