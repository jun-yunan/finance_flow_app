import 'package:finance_flow_app/components/auth/button-auth.dart';
import 'package:finance_flow_app/components/auth/button-social.dart';
import 'package:finance_flow_app/controllers/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FormSignIn extends StatefulWidget {
  // final bool isShowPassword = false;
  const FormSignIn({super.key});

  @override
  State<FormSignIn> createState() => _FormSignInState();
}

class _FormSignInState extends State<FormSignIn> {
  final AuthController authController = Get.find();

  bool isShowPassword = false;

  final _formKey = GlobalKey<FormState>();

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   authController.emailController.value.dispose();
  //   authController.passwordController.value.dispose();
  //   super.dispose();
  // }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Xử lý dữ liệu sau khi xác thực thành công
      final email = authController.emailController.value.text;
      final password = authController.passwordController.value.text;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email: $email, Password: $password')),
      );
      authController.emailController.value.clear();
      authController.passwordController.value.clear();
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
            if (authController.authType.value == AuthType.signUp)
              const Text(
                "Name",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            const SizedBox(height: 4),
            if (authController.authType.value == AuthType.signUp)
              TextFormField(
                controller: authController.emailController.value,
                decoration: InputDecoration(
                  hintText: 'Enter your name...',
                  prefixIcon: const Icon(Icons.person_2_outlined),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                      width: 2,
                    ),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
            const SizedBox(height: 20),
            const Text(
              "Email",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            TextFormField(
              controller: authController.emailController.value,
              decoration: InputDecoration(
                hintText: 'Enter your email...',
                prefixIcon: const Icon(Icons.email_outlined),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                    width: 2,
                  ),
                ),
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
            const SizedBox(height: 20),
            const Text(
              "Password",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            TextFormField(
              controller: authController.passwordController.value,
              decoration: InputDecoration(
                hintText: 'Enter your password...',
                prefixIcon: const Icon(Icons.lock_outline),
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
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                    width: 2,
                  ),
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
            if (authController.authType.value == AuthType.signIn)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 10),
            authController.authType.value == AuthType.signIn
                ? ButtonAuth(
                    title: "Sign In",
                    buttonType: ButtonType.large,
                    onPressed: _submitForm,
                  )
                : ButtonAuth(
                    title: "Sign Up",
                    buttonType: ButtonType.large,
                    onPressed: _submitForm,
                  ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                    height: 2,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  "OR",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                    height: 2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
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
            const SizedBox(height: 16),
            authController.authType.value == AuthType.signIn
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // authController.changeAuthStatus();
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // authController.changeAuthStatus();
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
