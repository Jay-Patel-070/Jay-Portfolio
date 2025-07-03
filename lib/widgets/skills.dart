import 'package:flutter/material.dart';
import 'package:jay_portfolio/components/skill_card.dart';
import 'package:jay_portfolio/constants/colors.dart';
import 'package:jay_portfolio/constants/skill_Items.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Column(
        children: [
          Text('Skills',style: TextStyle(
              color: CustomColor.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 30),),
          SizedBox(
            height: 18,
          ),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            children: SkillsItems.map((skill) {
              return SkillCircleCard(
                skillIcon: skill['skillIcon'],
                skillName: skill['skillName'],
                percentage: skill['percentage'],
              );
            }).toList(),
          ),
          // SkillCircleCard(
          //   skillName: 'Flutter',
          //   percentage: 0.85,
          //   iconPath: 'assets/Images/Jay_Image.jpg',
          // )
        ],
      ),
    );
  }
}
