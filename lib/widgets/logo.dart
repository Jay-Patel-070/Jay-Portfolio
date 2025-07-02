import 'package:flutter/material.dart';
import 'package:jay_portfolio/constants/colors.dart';

class Logo extends StatelessWidget {
  final VoidCallback? onTap;
  const Logo({super.key,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text('Jay',
          style: TextStyle(
              color: CustomColor.primary,
              fontSize: 30
          )),
    );
  }
}
