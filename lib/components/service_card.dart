import 'package:flutter/material.dart';
import 'package:jay_portfolio/constants/colors.dart';

class ServiceCard extends StatelessWidget {
  final String imgPath;
  final String title;
  final String description;

  const ServiceCard({
    Key? key,
    required this.imgPath,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomColor.accent,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: double.infinity,
          minHeight: 280,
          maxHeight: 280, // Maximum card height
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image container
              Container(
                height: 120,
                alignment: Alignment.center,
                child: Image.asset(
                  imgPath,
                  fit: BoxFit.contain,
                  width: 120,
                ),
              ),
              const SizedBox(height: 16),
              // Title
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: CustomColor.primary
                ),
              ),
              const SizedBox(height: 8),
              // Description with proper space management
              Flexible(
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Text(
                    description,
                    style: TextStyle(
                      color: CustomColor.secondaryTextColor,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}