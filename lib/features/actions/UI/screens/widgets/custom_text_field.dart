import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final int? maxLines;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.maxLines,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(hintText: hintText),
    );
  }
}
