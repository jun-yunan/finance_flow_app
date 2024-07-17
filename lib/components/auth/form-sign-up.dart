import 'package:finance_flow_app/components/auth/button-social.dart';
import 'package:finance_flow_app/components/button/button-custom.dart';
import 'package:finance_flow_app/controllers/AuthController.dart';
import 'package:finance_flow_app/screens/auth/sign-in/sign-in-screen.dart';
import 'package:finance_flow_app/screens/auth/sign-up/sign-up-screen.dart';
import 'package:finance_flow_app/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormSignUp extends StatefulWidget {
  const FormSignUp({super.key});

  @override
  State<FormSignUp> createState() => _FormSignUpState();
}

class _FormSignUpState extends State<FormSignUp> {
  final AuthController authController = Get.find();
  bool isShowPassword = false;

  final _formKey = GlobalKey<FormState>();

  void submitForm() async {
    if (_formKey.currentState!.validate()) {
      final email = authController.emailController.value.text;
      final password = authController.passwordController.value.text;
      final confirmPassword =
          authController.confirmPasswordController.value.text;
      final mobileNumber = authController.mobileNumber.value.text;
      final dateOfBirth = authController.dateOfBirth.value.text;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
          'Email: $email, Password: $password, MobileNumber: $mobileNumber, DateOfBirth: $dateOfBirth',
        )),
      );
      await authController.signUpEmailAndPassword(
          emailAddress: email, password: password);

      authController.resetFormSignUp();
      // showSnackbar(message: "message", style: SnackBarStyle.success);
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
                "Full Name",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: authController.nameController.value,
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
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your full name';
                }

                return null;
              },
            ),
            const SizedBox(height: 18),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Email",
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
            const SizedBox(height: 18),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Mobile Number",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: authController.mobileNumber.value,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                hintText: '+84 123 456 789',
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
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your full name';
                }

                return null;
              },
            ),
            const SizedBox(height: 18),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Date Of Birth",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: authController.dateOfBirth.value,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                hintText: 'DD / MM / YYYY',
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
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your full name';
                }

                return null;
              },
            ),
            const SizedBox(height: 18),
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
            const SizedBox(height: 18),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Confirm Password",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: authController.confirmPasswordController.value,
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
              title: "Sign Up",
              variant: ButtonVariant.primary,
              onPressed: () {
                // authController.authType.value = AuthType.signUp;
                // Get.to(() => const SignUpScreen());
                submitForm();
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
                  "Already have an account?",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    authController.authType.value = AuthType.signIn;
                    // Get.toNamed('/sign-up');
                    Get.to(() => const SignInScreen());
                  },
                  child: const Text(
                    "Sign In",
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
