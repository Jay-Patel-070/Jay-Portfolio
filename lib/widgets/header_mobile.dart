import 'package:flutter/material.dart';
import 'package:jay_portfolio/components/custom_button.dart';
import 'package:jay_portfolio/constants/colors.dart';
import 'package:jay_portfolio/widgets/logo.dart';

class HeaderMobile extends StatelessWidget {
  final VoidCallback onMenuTap;
  const HeaderMobile({super.key,required this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return  Container(
      height: 50,
      margin: EdgeInsets.fromLTRB(40, 5, 20, 5),
      child: Row(
        children: [
          IconButton(onPressed: onMenuTap, icon: Icon(Icons.menu)),
          Spacer(),
          Logo(),
          Spacer(),
          if (screenWidth >= 300)
            CustomButton(title: 'Download CV', onTap: () {
          },)
        ],
      ),
    );
  }
}
