import 'package:flutter/material.dart';

class FieldInput extends StatelessWidget {
  final String label;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final void Function()? onTap;

  const FieldInput({
    super.key,
    required this.label,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.onTap,
    this.readOnly,
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
          const SizedBox(height: 12),
          TextField(
            readOnly: readOnly ?? false,
            controller: controller,
            keyboardType: keyboardType,
            onTap: onTap,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 24),
              hintText: hintText,
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
