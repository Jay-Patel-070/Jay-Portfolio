import 'package:flutter/material.dart';
import 'package:jay_portfolio/constants/NavItems.dart';
import 'package:jay_portfolio/constants/colors.dart';

class DrawerMobile extends StatelessWidget {
  final Function(int) onNavItemTap;
  const DrawerMobile({super.key,required this.onNavItemTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColor.scaffoldBg,
      child: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20,top: 20,bottom: 20),
              child: IconButton(onPressed: () {
                Navigator.of(context).pop();
              }, icon: Icon(Icons.close,color: CustomColor.textColor,)),
            ),
          ),
          for(int i=0 ; i<NavIcons.length ; i++)
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 30),
              titleTextStyle: TextStyle(
                  color: CustomColor.textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16
              ),
              onTap: () {
                onNavItemTap(i);
              },
              leading: Icon(NavIcons[i],color: CustomColor.textColor),
              title: Text(NavTitles[i]),
            )
        ],
      ),
    );
  }
}
