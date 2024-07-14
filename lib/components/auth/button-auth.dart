import 'package:flutter/material.dart';

enum ButtonType { full, large, medium, small }

class ButtonAuth extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final ButtonType buttonType;

  const ButtonAuth({
    super.key,
    required this.title,
    this.onPressed,
    required this.buttonType,
  });

  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry margin;
    double fontSize;
    double paddingVertical;

    switch (buttonType) {
      case ButtonType.full:
        margin = const EdgeInsets.symmetric(horizontal: 0, vertical: 0);
        fontSize = 30;
        paddingVertical = 15;
        break;
      case ButtonType.large:
        margin = const EdgeInsets.symmetric(horizontal: 10, vertical: 15);
        fontSize = 24;
        paddingVertical = 12;
        break;
      case ButtonType.medium:
        margin = const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
        fontSize = 20;
        paddingVertical = 10;
        break;
      case ButtonType.small:
        margin = const EdgeInsets.symmetric(horizontal: 30, vertical: 5);
        fontSize = 16;
        paddingVertical = 8;
        break;
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      margin: margin,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          side: const BorderSide(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.symmetric(vertical: paddingVertical),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
