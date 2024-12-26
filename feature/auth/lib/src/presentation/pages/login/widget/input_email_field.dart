import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';

class InputEmailField extends StatelessWidget {
  const InputEmailField({super.key,
    required this.controller,
    this.onChanged,
    this.focusNode,
    this.alert = ''});

  final TextEditingController controller;
  final FocusNode? focusNode;
  final String alert;
  final Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return BaseInputField(
      controller: controller,
      focusNode: focusNode,
      label: "Email",
      hintText: "example@mail.com",
      isPasswordField: false,
      onChanged: onChanged,
      alert: alert,
    );

  }
}
