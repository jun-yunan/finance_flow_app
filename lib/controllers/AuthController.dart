import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_flow_app/models/UserModel.dart';
import 'package:finance_flow_app/screens/auth/sign-in/sign-in-screen.dart';
import 'package:finance_flow_app/screens/dashboard/dashboard-screen.dart';
import 'package:finance_flow_app/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  final FirebaseFirestore db = FirebaseFirestore.instance;

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

  final Rx<TextEditingController> mobileNumberController =
      Rx<TextEditingController>(TextEditingController());
  final Rx<TextEditingController> dateOfBirthController =
      Rx<TextEditingController>(TextEditingController());

  void resetFormSignUp() {
    emailController.value.clear();
    passwordController.value.clear();
    confirmPasswordController.value.clear();
    nameController.value.clear();
    mobileNumberController.value.clear();
    dateOfBirthController.value.clear();
    update();
  }

  void resetFormSignIn() {
    emailController.value.clear();
    passwordController.value.clear();
    update();
  }

  Future<void> setIsLogged() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogged', true);
  }

  Future<void> setIsLogout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogged', false);
  }

  Future<bool> checkIsLogged() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    firebaseAuth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });

    return firebaseAuth.currentUser != null ||
        prefs.getBool('isLogged') == true;
  }

  Future<void> signUpEmailAndPassword(
      {required String emailAddress, required String password}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      )
          .then((value) async {
        final UserModel user = UserModel(
          id: value.user!.uid,
          email: emailAddress,
          name: nameController.value.text,
          dateOfBirth: DateTime.now(),
          mobileNumber: "",
          avatar: '',
          address: '',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        await db
            .collection('users')
            .doc(value.user!.uid)
            .set(user.toJson())
            .then((value) {
          showSnackbar(
            message: "Sign up successfully",
            style: SnackBarStyle.success,
          );
          resetFormSignUp();
          setIsLogged();
          Navigator.pushAndRemoveUntil(
              Get.context!,
              MaterialPageRoute(builder: (context) => const DashboardScreen()),
              (route) => false);
        });
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
      print("login");
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
        setIsLogged();
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
      if (firebaseAuth.currentUser!.providerData[0].providerId ==
          'google.com') {
        await GoogleSignIn().signOut().then((value) {
          setIsLogout();
          showSnackbar(
              message: "Logout successfully", style: SnackBarStyle.success);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const SignInScreen()),
              (route) => false);
        });
      } else {
        await firebaseAuth.signOut().then((value) {
          setIsLogout();
          showSnackbar(
              message: "Logout successfully", style: SnackBarStyle.success);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const SignInScreen()),
              (route) => false);
        });
        firebaseAuth.currentUser?.providerData.forEach((element) {
          print(element.providerId);
        });
      }
    } catch (e) {
      print(e.toString());
      showSnackbar(message: "Something went wrong", style: SnackBarStyle.error);
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return;
      }
      final GoogleSignInAuthentication? googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);

      final User? user = userCredential.user;
      if (user != null) {
        final UserModel userModel = UserModel(
          id: user.uid,
          email: user.email!,
          name: user.displayName!,
          dateOfBirth: DateTime.now(),
          mobileNumber: "",
          avatar: user.photoURL!,
          address: "",
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        await db
            .collection('users')
            .doc(user.uid)
            .set(userModel.toJson())
            .then((value) {
          showSnackbar(
              message: "Login successfully", style: SnackBarStyle.success);
          setIsLogged();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const DashboardScreen()),
              (route) => false);
        });
      } else {
        print('Login Failed');
        showSnackbar(message: "Login Failed", style: SnackBarStyle.error);
      }
    } catch (e) {
      print(e.toString());
      showSnackbar(message: e.toString(), style: SnackBarStyle.error);
    }
  }
}
