import 'package:flutter/material.dart';

class SwitchToggle extends StatelessWidget {
  final bool value;
  final void Function(bool)? onChanged;
  const SwitchToggle({super.key, required this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Push Notifications",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              )),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: const Color(0xff00D09E),
            inactiveTrackColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
