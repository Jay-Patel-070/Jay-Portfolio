import 'package:flutter/material.dart';
import 'package:jay_portfolio/components/custom_button.dart';
import 'package:jay_portfolio/constants/colors.dart';
import 'package:line_icons/line_icons.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Texts
          Text(
            'Hi I am , Jay Patel',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: CustomColor.secondaryTextColor,
            ),
          ),
          const SizedBox(height: 6),
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [CustomColor.primary, CustomColor.secondaryTextColor],
            ).createShader(bounds),
            child: Text(
              'Mobile Application Developer',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Social icons row
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(LineIcons.instagram, color: CustomColor.textColor),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(LineIcons.linkedin, color: CustomColor.textColor),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(LineIcons.whatSApp, color: CustomColor.textColor),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(LineIcons.github, color: CustomColor.textColor),
                onPressed: () {},
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Download CV Button
          CustomButton(
            title: 'Download CV',
            onTap: () {},
          ),

          const SizedBox(height: 24),

          // Stats Card
          Card(
            color: CustomColor.accent,
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _statColumn('3+', 'Years\n Experience'),
                      Container(
                        width: 1.5,
                        height: 50,
                        color: CustomColor.secondaryTextColor,
                      ),
                      _statColumn('25+', 'Projects\n Done'),
                      Container(
                        width: 1.5,
                        height: 50,
                        color: CustomColor.secondaryTextColor,
                      ),
                      _statColumn('15+', 'Satisfied\n Users'),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Image at the bottom
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset('assets/images/Jay_Image.jpg',
                width: screenSize.width * 0.6,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statColumn(String count, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            count,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: CustomColor.primary,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13,
            color: CustomColor.textColor,
          ),
        ),
      ],
    );
  }
}
