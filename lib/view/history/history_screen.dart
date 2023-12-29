import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_currency_exchange/models/currency.dart';
import 'package:flutter_currency_exchange/view/history/bloc/history_bloc.dart';
import 'package:flutter_currency_exchange/view/history/bloc/history_state.dart';
import 'package:flutter_currency_exchange/view/history/widgets/history_widget.dart';

import '../../di/di_main.dart';
import '../../generated/l10n.dart';
import '../widgets/error_widget.dart';
import '../widgets/progress_widget.dart';
import 'bloc/history_event.dart';

class HistoryScreen extends StatefulWidget {
  Currency currency;

  HistoryScreen(this.currency, {super.key});

  @override
  State<StatefulWidget> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final _bloc = getIt<HistoryBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.add(GetCurrencyHistoryEvent(widget.currency));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(S.of(context).historyScreen),
        ),
        body: BlocProvider(
            create: (BuildContext context) {
              return _bloc;
            },
            child: BlocBuilder<HistoryBloc, BaseHistoryState>(
                builder: (context, state) => _buildPage(context, state))));
  }

  Widget _buildPage(BuildContext context, BaseHistoryState state) =>
      switch (state) {
        HistoryState() => HistoryWidget(state),
        ProgressState() => const ProgressWidget(),
        ErrorState() => ErrorCurrencyWidget(state.message)
      };

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }
}
