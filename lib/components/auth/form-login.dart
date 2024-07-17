import 'package:finance_flow_app/components/auth/button-social.dart';
import 'package:finance_flow_app/components/button/button-custom.dart';
import 'package:finance_flow_app/controllers/AuthController.dart';
import 'package:finance_flow_app/screens/auth/forgot-password-screen.dart';
import 'package:finance_flow_app/screens/auth/sign-up/sign-up-screen.dart';
import 'package:finance_flow_app/screens/dashboard/dashboard-screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final AuthController authController = Get.find();
  bool isShowPassword = false;

  final _formKey = GlobalKey<FormState>();

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Xử lý dữ liệu sau khi xác thực thành công
      final email = authController.emailController.value.text;
      final password = authController.passwordController.value.text;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email: $email, Password: $password')),
      );
      await authController.signInEmailAndPassword(
        emailAddress: email,
        password: password,
        context: context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Username or email",
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
                contentPadding: const EdgeInsets.symmetric(horizontal: 24),
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
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Password",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: authController.passwordController.value,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                hintText: "●●●●●●●●",
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
                suffixIcon: isShowPassword
                    ? IconButton(
                        icon: const Icon(Icons.visibility_outlined),
                        onPressed: () {
                          setState(() {
                            isShowPassword = !isShowPassword;
                          });
                        },
                      )
                    : IconButton(
                        icon: const Icon(Icons.visibility_off_outlined),
                        onPressed: () {
                          setState(() {
                            isShowPassword = !isShowPassword;
                          });
                        },
                      ),
              ),
              obscureText: isShowPassword ? true : false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters long';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 35,
            ),
            ButtonCustom(
              title: "Log In",
              variant: ButtonVariant.primary,
              onPressed: _submitForm,
            ),
            const SizedBox(
              height: 12,
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  Get.to(() => const ForgotPasswordScreen());
                },
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            ButtonCustom(
              title: "Sign Up",
              variant: ButtonVariant.secondary,
              onPressed: () {
                authController.authType.value = AuthType.signUp;
                // Get.toNamed('/sign-up');
                Get.to(() => const SignUpScreen());
              },
            ),
            const SizedBox(
              height: 12,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "or sign up with",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonSocial(
                  src: 'assets/images/facebook.png',
                  onPressed: () {},
                ),
                ButtonSocial(src: 'assets/images/google.png', onPressed: () {}),
                ButtonSocial(src: 'assets/images/github.png', onPressed: () {}),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
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
                    // Get.toNamed('/sign-up');
                    Get.to(() => const SignUpScreen());
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff3299FF)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
