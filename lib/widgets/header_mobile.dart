import 'package:flutter/material.dart';
import 'package:jay_portfolio/components/custom_button.dart';
import 'package:jay_portfolio/constants/colors.dart';
import 'package:jay_portfolio/widgets/logo.dart';

class HeaderMobile extends StatelessWidget {
  final VoidCallback onMenuTap;
  const HeaderMobile({super.key,required this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Row(
        children: [
          IconButton(onPressed: onMenuTap, icon: Icon(Icons.menu,color: CustomColor.textColor)),
          Spacer(),
          Logo(),
          Spacer(),
          Container(
            height: 20,
            width: 30,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
