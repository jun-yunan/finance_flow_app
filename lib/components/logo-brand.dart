import 'package:flutter/material.dart';

enum LogoType {
  light,
  dark,
}

class LogoBrand extends StatelessWidget {
  final LogoType type;
  const LogoBrand({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            type == LogoType.light
                ? "assets/images/logo.png"
                : "assets/images/logo1.png",
            width: 109,
            height: 115,
          ),
          Text(
            "Finance Flow",
            style: TextStyle(
              fontSize: 52,
              color: type == LogoType.light
                  ? const Color(0xff00D09E)
                  : Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
