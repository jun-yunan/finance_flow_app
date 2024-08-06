import 'package:finance_flow_app/controllers/TransactionController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonTransactionType extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final TransactionType? transactionType;
  final String assetsIcon;
  final bool? isActive;
  const ButtonTransactionType(
      {super.key,
      required this.label,
      this.onPressed,
      required this.assetsIcon,
      this.transactionType,
      this.isActive});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isActive == true ? Color(0xff00d09e) : Color(0xfff1fff3),
        foregroundColor: isActive == true ? Colors.white : Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (assetsIcon.isNotEmpty)
            SvgPicture.asset(
              assetsIcon,
              width: 20,
              height: 20,
              color: isActive == true ? Colors.white : null,
            ),
          const SizedBox(width: 4),
          Text(
            label.toUpperCase(),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
