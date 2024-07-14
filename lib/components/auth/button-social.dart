import 'package:flutter/material.dart';

class ButtonSocial extends StatelessWidget {
  final String src;
  final void Function()? onPressed;
  const ButtonSocial({super.key, required this.src, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(8),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        shadowColor: Colors.black87,
        backgroundColor: Colors.white,
      ),
      child: Image.asset(
        src,
        height: 50,
        width: 50,
        fit: BoxFit.cover,
      ),
    );
  }
}
