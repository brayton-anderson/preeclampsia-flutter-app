import 'package:flutter/material.dart';
import 'place_holder_box.dart';
import 'package:simple_animations/simple_animations.dart';
Widget titlePlaceholder() {
    return CustomAnimationBuilder<double>(
      duration: const Duration(milliseconds: 600),
      delay: Duration(milliseconds: (300 * 2.5).round()),
      tween: Tween<double>(begin: 0, end: 1),
      control: Control.play,
      curve: Curves.bounceIn,
      startPosition: 0.5,
      animationStatusListener: (status) {
        debugPrint('status updated: $status');
      },
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: placeholderBox(28, 150, Alignment.centerLeft),
        );
      },
    );
  }

  Widget contentPlaceHolder() {
    return CustomAnimationBuilder<double>(
      duration: const Duration(milliseconds: 600),
      delay: Duration(milliseconds: (300 * 3).round()),
      tween: Tween<double>(begin: 0, end: 1),
      control: Control.play,
      curve: Curves.easeInOut,
      startPosition: 0.5,
      animationStatusListener: (status) {
        debugPrint('status updated: $status');
      },
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: placeholderBox(250, double.infinity, Alignment.centerLeft),
        );
      },
    );
  }


  