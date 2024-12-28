import 'package:flutter/material.dart';

import '../../../components.dart';

class BaseDropdown<T> extends StatelessWidget {
  final T value;
  final List<T> items;
  final ValueChanged<T> onChanged;
  final String labelText;
  final String Function(T) itemToString;

  const BaseDropdown({
    Key? key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.itemToString,
    this.labelText = 'Status',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText.isNotEmpty)
          Text(
            labelText,
            style: TaskTypography.sm
                .merge(const TextStyle(color: AppColors.neutral70)),
          ).margin(bottom: 4),
        DropdownButtonFormField<T>(
          value: value,
          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(itemToString(item)),
            );
          }).toList(),
          onChanged: (T? newValue) {
            if (newValue != null) {
              onChanged(newValue); // Pass the value to the provided callback
            }
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(
                color: AppColors.neutral30,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(
                color: AppColors.neutral30,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(
                color: AppColors.neutral30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
