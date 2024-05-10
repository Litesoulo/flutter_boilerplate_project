import 'package:flutter/material.dart';

import '../../config/constants/dimens.dart';

extension BuildContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ThemeData get theme => Theme.of(this);

  Dimens get dimens => dependOnInheritedWidgetOfExactType<Dimens>()!;
}
