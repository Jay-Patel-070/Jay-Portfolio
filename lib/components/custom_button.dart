import 'package:flutter/material.dart';
import 'package:jay_portfolio/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const CustomButton({super.key,required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
    onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20), // Remove extra padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)), // Square corners
        ),
        backgroundColor: CustomColor.primary,
      ),
      child: Text(title, style: TextStyle(color: CustomColor.textColor)),);
  }
}
