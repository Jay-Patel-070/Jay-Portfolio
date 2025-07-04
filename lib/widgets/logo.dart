import 'package:flutter/material.dart';
import 'package:jay_portfolio/constants/colors.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Custom Monogram Circle with JV
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: CustomColor.primary,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: CustomColor.primary.withOpacity(0.4),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Text(
              'JV',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: 2,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        // Text part
        Text(
          'Jay-verse',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            color: CustomColor.primary,
            letterSpacing: 1.5,
            shadows: [
              Shadow(
                color: CustomColor.primary.withOpacity(0.3),
                offset: const Offset(2, 2),
                blurRadius: 4,
              )
            ],
          ),
        ),
      ],
    );
  }
}