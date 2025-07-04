import 'package:flutter/material.dart';
import 'package:jay_portfolio/components/custom_button.dart';
import 'package:jay_portfolio/constants/NavItems.dart';
import 'package:jay_portfolio/constants/colors.dart';
import 'package:jay_portfolio/widgets/logo.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class HeaderDesktop extends StatelessWidget {
  final Function(int) onNavItemTap;
  const HeaderDesktop({super.key,required this.onNavItemTap});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      height: 60,
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 80),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100)
      ),
      child: Row(
        children: [
          Logo(),
          Spacer(),
          for (int i=0 ; i < NavTitles.length ; i++)
            TextButton(
              onPressed: (){
                onNavItemTap(i);
              },
              child: Text(NavTitles[i],
                style: TextStyle(
                    color: CustomColor.textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
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
