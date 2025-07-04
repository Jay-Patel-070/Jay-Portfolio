import 'package:flutter/material.dart';
import 'package:jay_portfolio/components/service_card.dart';
import 'package:jay_portfolio/constants/colors.dart';
import 'package:jay_portfolio/constants/service_Items.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: double.maxFinite,
        color: CustomColor.scaffoldBg,
        padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Services',
              style: TextStyle(
                  color: CustomColor.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              "Whether it's building from scratch or refining what exists — I turn ideas into seamless digital experiences",
              style: TextStyle(
                  color: CustomColor.secondaryTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            SizedBox(
              height: 18,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: constraints.maxWidth > 1200
                    ? 4
                    : constraints.maxWidth > 1010
                    ? 3
                    : constraints.maxWidth > 693
                    ? 2
                    : 1,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1, // Optimized aspect ratio
              ),
              itemCount: ServiceItems.length,
              itemBuilder: (context, index) {
                final item = ServiceItems[index];
                return ServiceCard(
                  imgPath: item['imgPath']!,
                  title: item['title']!,
                  description: item['description']!,
                );
              },
            ),
          ],
        ),
      );
    },);
  }
}
