import 'dart:ui';

import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';

class BasePageLoading extends StatelessWidget {
  final bool isLoading;
  final double opacity;
  final Color? color;
  final double blurEffectIntensity;
  final Widget progressIndicator;
  final Offset? offset;
  final bool dismissible;
  final Widget child;

  const BasePageLoading({
    Key? key,
    required this.isLoading,
    this.opacity = 0.8,
    this.color,
    this.blurEffectIntensity = 0,
    required this.progressIndicator,
    this.offset,
    this.dismissible = false,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [child];
    if (isLoading) {
      Widget layOutProgressIndicator;
      if (offset == null) {
        layOutProgressIndicator = Center(child: progressIndicator);
      } else {
        layOutProgressIndicator = Positioned(
          left: offset!.dx,
          top: offset!.dy,
          child: progressIndicator,
        );
      }
      final modal = [
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: blurEffectIntensity,
            sigmaY: blurEffectIntensity,
          ),
          child: Opacity(
            opacity: opacity,
            child: ModalBarrier(
              dismissible: dismissible,
              color: color ?? AppColors.neutral40,
            ),
          ),
        ),
        layOutProgressIndicator,
      ];
      widgetList += modal;
    }
    return Stack(
      alignment: Alignment
          .bottomCenter, //causing slight problems **can restore anytime
      children: widgetList,
    );
  }
}
