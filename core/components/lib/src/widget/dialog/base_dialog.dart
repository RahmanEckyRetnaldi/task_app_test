import 'package:common_dependency/common_dependency.dart';
import 'package:components/src/extension/general_ext.dart';
import 'package:components/src/extension/widget_ext.dart';
import 'package:flutter/material.dart';


class BaseDialog extends HookWidget {
  final String? title;
  final TextStyle? titleStyle;
  final TextAlign titleAlign;
  final String? body;
  final TextStyle? bodyStyle;
  final TextAlign bodyAlign;
  final String? positiveButtonTitle;
  final TextStyle? positiveButtonTitleStyle;
  final Widget? positiveButtonWidget;
  final String? negativeButtonTitle;
  final TextStyle? negativeButtonTitleStyle;
  final Widget? negativeButtonWidget;
  final Function()? onPositiveButtonClicked;
  final Function()? onNegativeButtonClicked;
  final bool showCloseButton;
  final Widget? additionalComponentWidget;

  static Future<dynamic> show(
    BuildContext context, {
    String? title,
    String? body,
    bool barrierDismissible = true,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            return barrierDismissible;
          },
          child: BaseDialog(title: title, body: body),
        );
      },
    );
  }

  const BaseDialog({
    super.key,
    this.title,
    this.titleStyle,
    this.titleAlign = TextAlign.center,
    this.body,
    this.bodyStyle,
    this.bodyAlign = TextAlign.center,
    this.positiveButtonWidget,
    this.positiveButtonTitle,
    this.positiveButtonTitleStyle,
    this.negativeButtonWidget,
    this.negativeButtonTitle,
    this.negativeButtonTitleStyle,
    this.onPositiveButtonClicked,
    this.onNegativeButtonClicked,
    this.showCloseButton = false,
    this.additionalComponentWidget,
  });

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        return null;
      },
    );
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...[
                  if (title != null)
                    Text(
                      title!,
                      textAlign: titleAlign,
                      style:
                          titleStyle ?? TaskTypography.textTheme.displayMedium,
                    ).margin(
                      right: showCloseButton ? 32 : null,
                    ),
                  if (body != null)
                    Text(
                      body!,
                      textAlign: bodyAlign,
                      style: bodyStyle ?? TaskTypography.bodyText1,
                    ),
                ]..insertSeparator(
                    separator: const SizedBox(height: 12),
                  ),
                if (additionalComponentWidget != null)
                  additionalComponentWidget!,
                _buildButtons(context),
              ],
            ),
            if (showCloseButton)
              Positioned(
                top: 0,
                right: 0,
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: InkWell(
                    onTap: () => context.pop(),
                    child: const Icon(Icons.close),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    var content = [
      if (negativeButtonWidget != null) negativeButtonWidget!,
      if (negativeButtonWidget == null && negativeButtonTitle != null)
        Expanded(
          child: ElevatedButton(
            onPressed: onNegativeButtonClicked ??
                () => Navigator.of(context).pop(false),
            child: Text(negativeButtonTitle ?? ''),
          ),
        ),
      if (positiveButtonWidget != null) positiveButtonWidget!,
      if (positiveButtonWidget == null && positiveButtonTitle != null)
        Expanded(
          child: ElevatedButton(
            onPressed:  onPositiveButtonClicked ??
                    () => Navigator.of(context).pop(true),
            child: Text(positiveButtonTitle ?? ''),
          ),
        ),
    ];

    if (content.length > 1) {
      content.insert(1, const SizedBox(width: 8));
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (content.isNotEmpty) const SizedBox(height: 24),
        Row(
          children: content,
        ),
      ],
    );
  }
}
