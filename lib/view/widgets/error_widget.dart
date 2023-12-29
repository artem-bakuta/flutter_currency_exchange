import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class ErrorCurrencyWidget extends StatelessWidget {
  final String error;

  const ErrorCurrencyWidget(this.error, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(S.of(context).failedToLoad,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: Colors.red)),
          Text(error)
        ]);
  }
}
