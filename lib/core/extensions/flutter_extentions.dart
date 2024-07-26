import 'package:flutter/widgets.dart';

extension WidgetPadding on Widget {
  Widget padded([double all = 8.0]) {
    return Padding(
      padding: EdgeInsets.all(all),
      child: this,
    );
  }

  Widget paddedSymmetrically({
    double horizontal = 0.0,
    double vertical = 0.0,
    bool sliver = false,
  }) {
    final insets =
        EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
    if (sliver) {
      return SliverPadding(
        padding: insets,
        sliver: this,
      );
    }
    return Padding(
      padding: insets,
      child: this,
    );
  }

  Widget paddedOnly({
    double top = 0.0,
    double bottom = 0.0,
    double left = 0.0,
    double right = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
      ),
      child: this,
    );
  }

  Widget paddedLTRB(double left, double top, double right, double bottom) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: this,
    );
  }
}

extension WidgetsPadding on List<Widget> {
  List<Widget> padded([EdgeInsetsGeometry value = const EdgeInsets.all(8)]) {
    return map((child) => Padding(
          padding: value,
          child: child,
        )).toList();
  }
}
