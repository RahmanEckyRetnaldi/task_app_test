import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';

class InputSearchField extends StatelessWidget {
  const InputSearchField({
    super.key,
    required this.controller,
    this.onChanged,
    this.focusNode,
    this.alert = '',
    this.onSearchClicked,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final String alert;
  final Function(String value)? onChanged;
  final Function()? onSearchClicked;

  @override
  Widget build(BuildContext context) {
    return BaseInputField(
      controller: controller,
      focusNode: focusNode,
      label: "",
      hintText: "Search",
      isPasswordField: false,
      onChanged: onChanged,
      alert: alert,
      suffixIcon: IconButton(
        icon: const Icon(Icons.search),
        onPressed: onSearchClicked,
      ),
    );
  }
}
