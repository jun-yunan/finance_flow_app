import 'package:finance_flow_app/components/auth/button-auth.dart';
import 'package:flutter/material.dart';

enum ButtonVariant {
  primary,
  secondary,
  tertiary,
}

class ButtonCustom extends StatelessWidget {
  // final String colorHex;
  final String title;
  final void Function()? onPressed;
  final ButtonVariant variant;
  final ButtonType? type;
  const ButtonCustom(
      {super.key,
      // required this.colorHex,
      required this.title,
      this.onPressed,
      required this.variant,
      this.type});

  @override
  Widget build(BuildContext context) {
    switch (variant) {
      case ButtonVariant.primary:
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 45,
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff00D09E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        );

      case ButtonVariant.secondary:
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 45,
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffdff7e2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        );

      default:
        return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Text(title),
        );
    }

    // return Container();
  }
}
