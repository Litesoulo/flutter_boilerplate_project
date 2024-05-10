import 'package:flutter/material.dart';

class Dimens extends InheritedWidget {
  // For all screens
  final double horizontalPadding;
  final double verticalPadding;

  // Default border radius
  final double defaultBorderRadius;

  // Font size base
  final double fontSizeBase;

  const Dimens({
    super.key,
    this.fontSizeBase = 10.0,
    this.horizontalPadding = 12.0,
    this.verticalPadding = 12.0,
    this.defaultBorderRadius = 12.0,
    required Widget child,
  }) : super(child: child);

  static Dimens? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Dimens>();
  }

  @override
  bool updateShouldNotify(Dimens oldWidget) {
    return oldWidget.fontSizeBase != fontSizeBase;
  }
}
