import 'package:finance_flow_app/components/button/button-custom.dart';
import 'package:finance_flow_app/components/logo-brand.dart';
import 'package:finance_flow_app/controllers/AuthController.dart';
import 'package:finance_flow_app/screens/auth/forgot-password-screen.dart';
import 'package:finance_flow_app/screens/auth/sign-in/sign-in-screen.dart';
import 'package:finance_flow_app/screens/auth/sign-up/sign-up-screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LogoBrand(
                type: LogoType.light,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 35),
                child: const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod. ",
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 42),
              ButtonCustom(
                title: "Log In",
                variant: ButtonVariant.primary,
                onPressed: () {
                  authController.authType.value = AuthType.signIn;
                  Get.to(() => const SignInScreen());
                },
              ),
              const SizedBox(height: 8),
              ButtonCustom(
                title: "Sign Up",
                variant: ButtonVariant.secondary,
                onPressed: () {
                  authController.authType.value = AuthType.signUp;
                  Get.to(() => const SignUpScreen());
                },
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => const ForgotPasswordScreen());
                },
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
