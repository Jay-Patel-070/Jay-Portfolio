import 'package:flutter/material.dart';
import 'package:jay_portfolio/constants/colors.dart';
import 'package:jay_portfolio/widgets/logo.dart';
import 'package:provider/provider.dart';

class HeaderMobile extends StatelessWidget {
  final VoidCallback onMenuTap;
  const HeaderMobile({super.key,required this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return  Container(
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Row(
        children: [
          IconButton(onPressed: onMenuTap, icon: Icon(Icons.menu,color: CustomColor.textColor)),
          Spacer(),
          Logo(),
          Spacer(),
          IconButton(
            icon: Icon(Icons.brightness_6, color: CustomColor.textColor),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
    );
  }
}
