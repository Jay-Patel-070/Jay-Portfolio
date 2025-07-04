import 'package:flutter/material.dart';
import 'package:jay_portfolio/components/project_card.dart';
import 'package:jay_portfolio/constants/colors.dart';
import 'package:jay_portfolio/constants/project_Items.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: double.maxFinite,
        color: CustomColor.scaffoldBg,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 18,
            ),
            Text('Projects',style: TextStyle(
                color: CustomColor.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 30),),
            SizedBox(
              height: 18,
            ),
            GridView.count(
              crossAxisCount: constraints.maxWidth > 1200
                  ? 4
                  : constraints.maxWidth > 1010
                  ? 3
                  : constraints.maxWidth > 680
                  ? 2
                  : 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: projects.map((p) => ProjectCard(
                imagePath: p['imagePath']!,
                projectName: p['projectName']!,
                category: p['category']!,
              )).toList(),
            ),
          ],
        ),
      );
    },);
  }
}
