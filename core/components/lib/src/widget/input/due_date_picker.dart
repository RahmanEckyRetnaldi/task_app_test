import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../components.dart';

class DueDatePicker extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String errorMessage;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;

  const DueDatePicker({
    Key? key,
    required this.controller,
    this.labelText = 'Due Date',
    this.errorMessage =
        "Selected date cannot be earlier than today. Set to today!",
    this.initialDate,
    this.firstDate,
    this.lastDate,
  }) : super(key: key);

  Future<void> _pickDueDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? now,
      firstDate: firstDate ?? DateTime(2000),
      lastDate: lastDate ?? DateTime(2100),
    );

    if (pickedDate != null) {
      if (pickedDate.isBefore(now)) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage),
              backgroundColor: Colors.orange,
            ),
          );
        }
        controller.text = DateFormat('dd MMM yyyy').format(now);
      } else {
        controller.text = DateFormat('dd MMM yyyy').format(pickedDate);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseInputField(
      controller: controller,
      readOnly: true,
      label: labelText,
      alert: errorMessage,
      hintText: 'Pilih Tanggal',
      onTap: () => _pickDueDate(context) ,
      suffixIcon: const Icon(Icons.calendar_today),
    );
  }
}
