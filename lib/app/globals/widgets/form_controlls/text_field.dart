import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimpleTextField extends StatelessWidget {
  final String? initialValue;
  final TextEditingController? controller;
  final bool? enabled;
  final String labelText;
  final bool obscureText;
  final AutovalidateMode? autovalidateMode;
  final FormFieldValidator<String>? validator;

  const SimpleTextField({
    this.initialValue,
    this.controller,
    this.enabled,
    required this.labelText,
    this.obscureText = false,
    this.autovalidateMode,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      controller: controller,
      enabled: enabled,
      decoration: InputDecoration(
          labelText: labelText.tr,
          hintStyle: TextStyle(fontWeight: FontWeight.w600)),
      obscureText: obscureText,
      autovalidateMode: autovalidateMode,
      validator: validator,
    );
  }
}
