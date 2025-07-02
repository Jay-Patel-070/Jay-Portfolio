import 'package:flutter/material.dart';
import 'package:jay_portfolio/components/custom_button.dart';
import 'package:jay_portfolio/constants/colors.dart';
import 'package:line_icons/line_icons.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: screenSize.height / 1.2,
      constraints: BoxConstraints(minHeight: 350),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ' Hi I am',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.secondaryTextColor, // overridden by shader
                ),
              ),
              Text('Jay Patel',style: TextStyle(
                  color: CustomColor.secondaryTextColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              ),),
              ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: [Color(0xFFFD6F00), Color(0xFFFFC371)],
                ).createShader(bounds),
                child: Text(
                  'Mobile Application Developer',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Colors.white, // overridden by shader
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  IconButton(
                    icon: Icon(LineIcons.instagram, color: CustomColor.textColor),
                    onPressed: () {
                      // Open Instagram
                    },
                  ),
                  IconButton(
                    icon: Icon(LineIcons.linkedin, color: CustomColor.textColor),
                    onPressed: () {
                      // Open LinkedIn
                    },
                  ),
                  IconButton(
                    icon: Icon(LineIcons.whatSApp, color: CustomColor.textColor),
                    onPressed: () {
                      // Open WhatsApp
                    },
                  ),
                  IconButton(
                    icon: Icon(LineIcons.github, color: CustomColor.textColor),
                    onPressed: () {
                      // Open GitHub
                    },
                  ),
                ],
              ),
              SizedBox(height: 20,),
              CustomButton(title: 'Download CV', onTap: () {

              },),
              SizedBox(height: 30,),
              Card(
                color: CustomColor.accent,
                elevation: 8,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                '3+',
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: CustomColor.primary,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Years Experience',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: CustomColor.textColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        width: 1.5,
                        height: 50,
                        color: CustomColor.secondaryTextColor,
                      ),
                      Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                '25+',
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: CustomColor.primary,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Projects Done',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: CustomColor.textColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        width: 1.5,
                        height: 50,
                        color: CustomColor.secondaryTextColor,
                      ),
                      Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                '15+',
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: CustomColor.primary,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Satisfied Users',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: CustomColor.textColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset('assets/images/Jay_Image.jpg',
              width: screenSize.width / 4,
            ),
          )
        ],
      ),
    );
  }
}
