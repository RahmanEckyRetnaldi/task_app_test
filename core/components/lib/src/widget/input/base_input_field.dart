import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseInputField extends StatefulWidget {
  const BaseInputField({
    Key? key,
    required this.controller,
    this.onChanged,
    this.focusNode,
    this.label = '',
    this.hintText = '',
    this.alert = '',
    this.isPasswordField = false,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly = false,
    this.onTap,
    this.maxLines,
    this.minLines,
    this.inputFormatter,
    this.maxLength
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode? focusNode;
  final String label;
  final String hintText;
  final String alert;
  final bool readOnly;
  final Function(String value)? onChanged;
  final bool isPasswordField;
  final Function()? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final List<TextInputFormatter>? inputFormatter;
  final int? maxLength;

  @override
  State<BaseInputField> createState() => _BaseInputFieldState();
}

class _BaseInputFieldState extends State<BaseInputField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label.isNotEmpty)
          Text(
            widget.label,
            style: TaskTypography.sm
                .merge(const TextStyle(color: AppColors.neutral70)),
          ).margin(bottom: 4),
        TextField(
          controller: widget.controller,
          onChanged: widget.onChanged,
          focusNode: widget.focusNode,
          readOnly: widget.readOnly,
          onTap: widget.onTap,
          maxLines:widget.isPasswordField && _isObscured ? 1 : widget.maxLines,
          minLines: widget.minLines,
          obscureText: widget.isPasswordField && _isObscured,
          style: theme.textTheme.bodyLarge?.merge(TextStyle(
            fontWeight: FontWeight.bold,
            color: widget.alert.isNotEmpty
                ? theme.colorScheme.error
                : theme.colorScheme.onBackground,
          )),
          cursorColor: theme.colorScheme.primary,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.isPasswordField
                ? IconButton(
                    icon: Icon(
                      _isObscured
                          ? Icons.visibility_off // Hide icon
                          : Icons.visibility, // Show icon
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscured =
                            !_isObscured; // Toggle password visibility
                      });
                    },
                  )
                : widget.suffixIcon,
            hintText: widget.hintText,
            hintStyle: theme.textTheme.bodyLarge?.merge(const TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.neutral40,
            )),
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
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color: theme.colorScheme.error,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color: theme.colorScheme.error,
              ),
            ),
            errorText: widget.alert.nullWhenEmpty(),
            errorMaxLines: 2,
            errorStyle: TaskTypography.sm.merge(TextStyle(
              color: theme.colorScheme.error,
            )),
          ),
          keyboardType: widget.isPasswordField
              ? TextInputType.visiblePassword
              : TextInputType.text,
          inputFormatters: widget.inputFormatter,
          maxLength: widget.maxLength,
        ),
      ],
    );
  }
}
