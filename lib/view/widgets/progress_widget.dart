import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
            child: CircularProgressIndicator(
                semanticsLabel: S.of(context).loadingWaiting, value: null)));
  }
}
