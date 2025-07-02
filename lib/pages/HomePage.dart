import 'package:flutter/material.dart';
import 'package:jay_portfolio/components/custom_button.dart';
import 'package:jay_portfolio/constants/colors.dart';
import 'package:jay_portfolio/constants/size.dart';
import 'package:jay_portfolio/widgets/drawer_mobile.dart';
import 'package:jay_portfolio/widgets/header_desktop.dart';
import 'package:jay_portfolio/widgets/header_mobile.dart';
import 'package:jay_portfolio/widgets/main_desktop.dart';
import 'package:jay_portfolio/widgets/main_mobile.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
    final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColor.scaffoldBg,
          drawer: constraints.maxWidth > minDesktopWidth ? null : DrawerMobile(),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              if(constraints.maxWidth >= minDesktopWidth)
              HeaderDesktop(onTap: () {

              },)else
              HeaderMobile(onMenuTap: () {
                scaffoldKey.currentState?.openDrawer();
              },),
              if(constraints.maxWidth > minDesktopWidth)
              MainDesktop() else
              MainMobile()
              // Container(
              //   height: 500,
              //   width: double.maxFinite,
              //   color: Colors.blueGrey,
              // ),
              // Container(
              //   height: 500,
              //   width: double.maxFinite,
              //   color: Colors.blueGrey,
              // ),
              // Container(
              //   height: 500,
              //   width: double.maxFinite,
              //   color: Colors.blueGrey,
              // ),
            ],
          )
      );
    },);
  }
}
