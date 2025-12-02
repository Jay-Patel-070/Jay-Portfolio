import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jay_portfolio/components/custom_button.dart';
import 'package:jay_portfolio/constants/colors.dart';

class ContactFormScreen extends StatefulWidget {
  const ContactFormScreen({super.key});

  @override
  State<ContactFormScreen> createState() => _ContactFormScreenState();
}

class _ContactFormScreenState extends State<ContactFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _roleController = TextEditingController();
  final _helpController = TextEditingController();
  final _extraController = TextEditingController();

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();

    _nameController.addListener(_updateButtonState);
    _phoneController.addListener(_updateButtonState);
    _emailController.addListener(_updateButtonState);
    _roleController.addListener(_updateButtonState);
    _helpController.addListener(_updateButtonState);

    // Run update after first frame, so form state is available
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateButtonState();
    });
  }

  bool _isFormValid() {
    return _formKey.currentState?.validate() ?? false;
  }

  void _updateButtonState() {
    final allFieldsFilled = _nameController.text.trim().isNotEmpty &&
        _phoneController.text.trim().isNotEmpty &&
        _emailController.text.trim().isNotEmpty &&
        _roleController.text.trim().isNotEmpty &&
        _helpController.text.trim().isNotEmpty;

    setState(() {
      isButtonEnabled = allFieldsFilled;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _roleController.dispose();
    _helpController.dispose();
    _extraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Contact Me',
                style: TextStyle(
                    color: CustomColor.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "I'm always open to discussing new opportunities, freelance work, or collaborations. Feel free to reach out — let's build something great together!",
                style: TextStyle(
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
                  child: CustomButton(
                    title: 'Send',
                    onTap: isButtonEnabled
                        ? () async {
                            if (_formKey.currentState!.validate()) {
                              try {
                                await FirebaseFirestore.instance
                                    .collection('contacts')
                                    .add({
                                  'name': _nameController.text.trim(),
                                  'phone': _phoneController.text.trim(),
                                  'email': _emailController.text.trim(),
                                  'his-role': _roleController.text.trim(),
                                  'subject': _helpController.text.trim(),
                                  'description': _extraController.text.trim(),
                                  'timestamp': FieldValue.serverTimestamp(),
                                });
                                // Optional: Show success message
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Message sent successfully!')),
                                );

                                // Clear fields
                                _nameController.clear();
                                _phoneController.clear();
                                _emailController.clear();
                                _roleController.clear();
                                _helpController.clear();
                                _extraController.clear();
                              } catch (e) {
                                // Show error message
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text('Failed to send message: $e')),
                                );
                              }
                            }
                          }
                        : null,
                  )),
            ],
          ),
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
          _buildTextField(label: 'Name*', controller: _nameController),
          const SizedBox(height: 16),
          _buildTextField(
              label: 'Phone Number*',
              controller: _phoneController,
              keyboardType: TextInputType.phone),
        ] else ...[
          _buildTextField(
              label: 'Email*',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress),
          const SizedBox(height: 16),
          _buildTextField(
              label: 'What do you do?*', controller: _roleController),
          const SizedBox(height: 16),
          _buildTextField(
              label: 'How can I help you?*', controller: _helpController),
          const SizedBox(height: 16),
          _buildTextField(
              label: "Anything you'd like to add?",
              controller: _extraController,
              maxLines: 4,
              isRequired: false),
        ],
      ],
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    int maxLines = 1,
    TextInputType? keyboardType,
    bool isRequired = true,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: (value) {
        if (isRequired && (value == null || value.trim().isEmpty)) {
          return 'This field is required';
        }
        if (label.toLowerCase().contains('phone')) {
          // Phone validation: only digits, length 10 (you can modify)
          final phoneRegExp = RegExp(r'^\+?[0-9]{10,15}$');
          if (!phoneRegExp.hasMatch(value!.trim())) {
            return 'Enter a valid phone number';
          }
        } else if (label.toLowerCase().contains('email')) {
          // Email validation using regex
          final emailRegExp = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
          if (!emailRegExp.hasMatch(value!.trim())) {
            return 'Enter a valid email address';
          }
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        labelStyle: TextStyle(color: CustomColor.secondaryTextColor),
        floatingLabelStyle: TextStyle(color: CustomColor.primary),
        fillColor: CustomColor.accent,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColor.primary),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      ),
    );
  }
}
