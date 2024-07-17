import 'dart:async';

import 'package:finance_flow_app/screens/auth/sign-in/sign-in-screen.dart';
import 'package:finance_flow_app/screens/dashboard/dashboard-screen.dart';
import 'package:finance_flow_app/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final Rx<bool> isLogged = Rx<bool>(false);

  final Rx<bool> isShowPassword = Rx<bool>(false);

  final Rx<AuthType?> authType = Rx<AuthType?>(null);

  final Rx<TextEditingController> emailController =
      Rx<TextEditingController>(TextEditingController());
  final Rx<TextEditingController> passwordController =
      Rx<TextEditingController>(TextEditingController());
  final Rx<TextEditingController> confirmPasswordController =
      Rx<TextEditingController>(TextEditingController());

  final Rx<TextEditingController> nameController =
      Rx<TextEditingController>(TextEditingController());

  final Rx<TextEditingController> mobileNumber =
      Rx<TextEditingController>(TextEditingController(text: '+8476399584'));
  final Rx<TextEditingController> dateOfBirth =
      Rx<TextEditingController>(TextEditingController(text: '24-05-2003'));

  void resetFormSignUp() {
    emailController.value.clear();
    passwordController.value.clear();
    nameController.value.clear();
    mobileNumber.value.clear();
    dateOfBirth.value.clear();
    update();
  }

  void resetFormSignIn() {
    emailController.value.clear();
    passwordController.value.clear();
    update();
  }

  bool checkIsLogged() {
    firebaseAuth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });

    return firebaseAuth.currentUser != null;
  }

  Future<void> signUpEmailAndPassword(
      {required String emailAddress, required String password}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      )
          .then((value) {
        showSnackbar(
            message: "Sign up successfully", style: SnackBarStyle.success);
        resetFormSignUp();
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        showSnackbar(
            message: "The password provided is too weak.",
            style: SnackBarStyle.error);
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        showSnackbar(
            message: "The account already exists for that email.",
            style: SnackBarStyle.error);
      }
    } catch (e) {
      print(e.toString());
      showSnackbar(message: e.toString(), style: SnackBarStyle.error);
    }
  }

  Future<void> signInEmailAndPassword(
      {required String emailAddress,
      required String password,
      required BuildContext context}) async {
    try {
      await firebaseAuth
          .signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      )
          .then((value) {
        showSnackbar(
            message: "Sign in successfully", style: SnackBarStyle.success);

        print(firebaseAuth.currentUser!.email);
        resetFormSignIn();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const DashboardScreen()),
            (route) => false);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        showSnackbar(
            message: "No user found for that email.",
            style: SnackBarStyle.error);
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        showSnackbar(
            message: "Wrong password provided for that user.",
            style: SnackBarStyle.error);
      }
    } catch (e) {
      print(e.toString());
      showSnackbar(message: e.toString(), style: SnackBarStyle.error);
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await firebaseAuth.signOut().then((value) {
        showSnackbar(
            message: "Logout successfully", style: SnackBarStyle.success);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const SignInScreen()),
            (route) => false);
      });
    } catch (e) {
      print(e.toString());
      showSnackbar(message: "Something went wrong", style: SnackBarStyle.error);
    }
  }
}
