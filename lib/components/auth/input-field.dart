import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  const InputField({super.key, required this.label, this.controller});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.label,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: widget.controller,
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
        ],
      ),
    );
  }
}
