import 'package:flutter/material.dart';
import 'package:jay_portfolio/components/custom_button.dart';
import 'package:jay_portfolio/constants/colors.dart';

class ContactFormScreen extends StatelessWidget {
  const ContactFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Contact Me',style: TextStyle(
                color: CustomColor.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 30),),
            SizedBox(
              height: 18,
            ),
            Text(
              'Cultivating Connections: Reach Out And Connect With Me',style: TextStyle(
                color: CustomColor.secondaryTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 15),
            ),
            const SizedBox(height: 24),
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 680) {
                  // Desktop/tablet layout - 2 columns
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _buildFormColumn(isFirstColumn: true)),
                      const SizedBox(width: 16),
                      Expanded(child: _buildFormColumn(isFirstColumn: false)),
                    ],
                  );
                } else {
                  // Mobile layout - all fields in one column stacked vertically
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildFormColumn(isFirstColumn: true),
                      const SizedBox(height: 16),
                      _buildFormColumn(isFirstColumn: false),
                    ],
                  );
                }
              },
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: CustomButton(title: 'Send', onTap: () {

              },),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormColumn({required bool isFirstColumn}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (isFirstColumn) ...[
          _buildTextField(label: 'Name'),
          const SizedBox(height: 16),
          _buildTextField(label: 'Phone Number', keyboardType: TextInputType.phone),
        ] else ...[
          _buildTextField(label: 'Email', keyboardType: TextInputType.emailAddress),
          const SizedBox(height: 16),
          _buildTextField(label: 'Service Of Interest'),
          const SizedBox(height: 16),
          _buildTextField(label: 'Timeline'),
          const SizedBox(height: 16),
          _buildTextField(label: 'Project Details...', maxLines: 4),
        ],
      ],
    );
  }

  Widget _buildTextField({
    required String label,
    int maxLines = 1,
    TextInputType? keyboardType,
  }) {
    return TextField(
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      labelStyle: TextStyle(
        color: CustomColor.secondaryTextColor
      ),
      floatingLabelStyle: TextStyle(
        color: CustomColor.primary
      ),
        fillColor: CustomColor.accent,
      filled: true,
      focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: CustomColor.primary)),  // Color when focused
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      ),
    );
  }
}