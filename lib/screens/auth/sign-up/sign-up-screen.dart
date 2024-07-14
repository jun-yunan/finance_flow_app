import 'package:finance_flow_app/components/auth/form-sign-up.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  "Create Account",
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
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: ListView(
                children: [FormSignUp()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
