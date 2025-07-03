import 'package:flutter/material.dart';
import 'package:jay_portfolio/constants/colors.dart';
import 'package:line_icons/line_icons.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SkillCircleCard extends StatelessWidget {
  final IconData skillIcon;
  final String skillName;
  final double percentage; // 0.0 to 1.0

  const SkillCircleCard({
    super.key,
    required this.skillName,
    required this.percentage,
    required this.skillIcon
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          CircularPercentIndicator(
            radius: 80.0,
            lineWidth: 10.0,
            animation: true,
            percent: percentage,
            center: Icon(skillIcon,color: CustomColor.secondaryTextColor,size: 60,),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: CustomColor.primary,
            backgroundColor: CustomColor.accent
          ),
          const SizedBox(height: 8),
          Text(
            "${(percentage * 100).toInt()}%",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: CustomColor.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            skillName,
            style: TextStyle(
              fontSize: 14,
              color: CustomColor.secondaryTextColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}