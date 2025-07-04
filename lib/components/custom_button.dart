import 'package:flutter/material.dart';
import 'package:jay_portfolio/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap; // Make nullable

  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDisabled = onTap == null;

    return ElevatedButton(
      onPressed: onTap, // null disables the button
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        backgroundColor:
        isDisabled ? CustomColor.accent : CustomColor.primary,
        foregroundColor: CustomColor.textColor,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: CustomColor.textColor.withOpacity(isDisabled ? 0.5 : 1.0),
        ),
      ),
    );
  }
}