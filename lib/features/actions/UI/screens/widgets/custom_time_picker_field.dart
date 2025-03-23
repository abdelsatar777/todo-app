import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomTimePickerField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const CustomTimePickerField({
    super.key,
    required this.controller,
    this.hintText = "Select Time",
  });

  @override
  State<CustomTimePickerField> createState() => _CustomTimePickerFieldState();
}

class _CustomTimePickerFieldState extends State<CustomTimePickerField> {
  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        final now = DateTime.now();
        final formattedTime = DateFormat('hh:mm a').format(
          DateTime(now.year, now.month, now.day, picked.hour, picked.minute),
        );
        widget.controller.text = formattedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () => _selectTime(context),
      controller: widget.controller,
      readOnly: true,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: const Icon(Icons.access_time),
      ),
    );
  }
}
