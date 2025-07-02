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
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Texts
          Text(
            'Hi I am',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: CustomColor.secondaryTextColor,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Jay Patel',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: CustomColor.secondaryTextColor,
            ),
          ),
          const SizedBox(height: 6),
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Color(0xFFFD6F00), Color(0xFFFFC371)],
            ).createShader(bounds),
            child: Text(
              'Mobile Application Developer',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Social icons row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(LineIcons.instagram, color: Colors.white, size: 26),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(LineIcons.linkedin, color: Colors.white, size: 26),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(LineIcons.whatSApp, color: Colors.white, size: 26),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(LineIcons.github, color: Colors.white, size: 26),
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
              child: Image.network(
                'https://tse1.mm.bing.net/th/id/OIP.Y3Dk8Kbn5Vgje7GwBAJWtgHaLH?cb=thvnextc2&rs=1&pid=ImgDetMain&o=7&rm=3',
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
            style: const TextStyle(
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
          style: const TextStyle(
            fontSize: 13,
            color: CustomColor.textColor,
          ),
        ),
      ],
    );
  }
}
