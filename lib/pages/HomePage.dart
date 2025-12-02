import 'package:flutter/material.dart';
import 'package:jay_portfolio/components/contact_Component.dart';
import 'package:jay_portfolio/components/custom_button.dart';
import 'package:jay_portfolio/components/project_card.dart';
import 'package:jay_portfolio/components/service_card.dart';
import 'package:jay_portfolio/components/skill_card.dart';
import 'package:jay_portfolio/constants/colors.dart';
import 'package:jay_portfolio/constants/service_Items.dart';
import 'package:jay_portfolio/constants/size.dart';
import 'package:jay_portfolio/constants/skill_Items.dart';
import 'package:jay_portfolio/widgets/drawer_mobile.dart';
import 'package:jay_portfolio/widgets/header_desktop.dart';
import 'package:jay_portfolio/widgets/header_mobile.dart';
import 'package:jay_portfolio/widgets/main_desktop.dart';
import 'package:jay_portfolio/widgets/main_mobile.dart';
import 'package:jay_portfolio/widgets/projects.dart';
import 'package:jay_portfolio/widgets/services.dart';
import 'package:jay_portfolio/widgets/skills.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final scrollControll = ScrollController();
  final List<GlobalKey> navBarKeys = List.generate(5, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColor.scaffoldBg,
          drawer: constraints.maxWidth > minDesktopWidth
              ? null
              : DrawerMobile(
            onNavItemTap: (int navIndex) {
              scaffoldKey.currentState!.closeDrawer();
              scrollToSection(navIndex);
            },
          ),

          body: Stack(
            children: [
              /// ⭐ Scrollable content
              Padding(
                padding: EdgeInsets.only(top: 60), // space for fixed header
                child: SingleChildScrollView(
                  controller: scrollControll,
                  child: Column(
                    children: [
                      SizedBox(key: navBarKeys.first),
                      if (constraints.maxWidth > minDesktopWidth)
                        MainDesktop()
                      else
                        MainMobile(),

                      Services(key: navBarKeys[1]),
                      Skills(key: navBarKeys[2]),
                      Projects(key: navBarKeys[3]),
                      ContactFormScreen(key: navBarKeys[4]),

                      SizedBox(height: 50),
                      Text(
                        "Copyright 2025 by jay",
                        style: TextStyle(color: CustomColor.textColor),
                      ),
                    ],
                  ),
                ),
              ),

              /// ⭐ Fixed Header (does NOT scroll)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: constraints.maxWidth >= minDesktopWidth
                    ? HeaderDesktop(
                  onNavItemTap: (int navIndex) {
                    scrollToSection(navIndex);
                  },
                )
                    : HeaderMobile(
                  onMenuTap: () {
                    scaffoldKey.currentState?.openDrawer();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void scrollToSection(int navIndex) {
    if (navIndex == 5) {
      return;
    }
    final key = navBarKeys[navIndex];
    Scrollable.ensureVisible(
        key.currentContext!,
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeInOut
    );
  }
}
