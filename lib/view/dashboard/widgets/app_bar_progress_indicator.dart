import 'package:flutter/material.dart';

const double _kAppBarProgressIndicatorHeight = 4.0;

class AppBarProgressIndicator extends SizedBox implements PreferredSizeWidget {
  AppBarProgressIndicator(bool isProgress, {Key? key})
      : super(
            key: key,
            height: isProgress ? _kAppBarProgressIndicatorHeight : 0,
            child: isProgress ? const LinearProgressIndicator() : Container());

  @override
  Size get preferredSize =>
      const Size(double.infinity, _kAppBarProgressIndicatorHeight);
}
