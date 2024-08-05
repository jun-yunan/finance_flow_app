import 'package:flutter/material.dart';

class FieldInput extends StatelessWidget {
  final String label;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final void Function()? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const FieldInput({
    super.key,
    required this.label,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.onTap,
    this.readOnly,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          TextField(
            readOnly: readOnly ?? false,
            controller: controller,
            keyboardType: keyboardType,
            onTap: onTap,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 24),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Color(0xffa5a5a5),
                fontSize: 16,
              ),
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
          ),
        ],
      ),
    );
  }
}
