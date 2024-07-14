import 'package:finance_flow_app/components/auth/button-social.dart';
import 'package:finance_flow_app/components/button/button-custom.dart';
import 'package:finance_flow_app/controllers/AuthController.dart';
import 'package:finance_flow_app/screens/auth/sign-up/sign-up-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Color(0xff00D09E),
                // borderRadius: BorderRadius.only(
                //   topLeft: Radius.circular(60),
                //   topRight: Radius.circular(60),
                // ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(50),
                child: Text(
                  "Forgot Password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 150,
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: ListView(
                children: [
                  const Text(
                    "Reset Password?",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 65),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Enter email address",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: authController.emailController.value,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 24),
                      hintText: 'example@example.com',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      filled: true,
                      fillColor: const Color(0xffdff7e2),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 45),
                  ButtonCustom(
                    title: "Next Step",
                    variant: ButtonVariant.primary,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 60),
                  ButtonCustom(
                    title: "Sign Up",
                    variant: ButtonVariant.secondary,
                    onPressed: () {
                      authController.authType.value = AuthType.signUp;
                      Get.to(() => const SignUpScreen());
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 18),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "or sign up with",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonSocial(
                        src: 'assets/images/facebook.png',
                        onPressed: () {},
                      ),
                      ButtonSocial(
                        src: 'assets/images/google.png',
                        onPressed: () {},
                      ),
                      ButtonSocial(
                        src: 'assets/images/github.png',
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          authController.authType.value = AuthType.signUp;
                          Get.to(() => const SignUpScreen());
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff3299FF),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
