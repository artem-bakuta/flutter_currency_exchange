import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_currency_exchange/view/dashboard/bloc/dashboard_state.dart';
import 'package:flutter_currency_exchange/view/dashboard/widgets/dashboard_widget.dart';

import '../../di/di_main.dart';
import '../../generated/l10n.dart';
import '../widgets/error_widget.dart';
import '../widgets/progress_widget.dart';
import 'bloc/dashboard_bloc.dart';
import 'bloc/dashboard_event.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<StatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends State<DashboardScreen> {
  final _bloc = getIt<DashboardBloc>();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _bloc.add(GetCurrencyRatesEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(S.of(context).dashboardCurrencies),
        ),
        body: BlocProvider(
            create: (BuildContext context) {
              return _bloc;
            },
            child: BlocBuilder<DashboardBloc, BaseDashBoardState>(
                builder: (context, state) => _buildPage(context, state))));
  }

  Widget _buildPage(BuildContext context, BaseDashBoardState state) =>
      switch (state) {
        DashboardState() => DashboardWidget(state),
        InitState() => const ProgressWidget(),
        ErrorState() => ErrorCurrencyWidget(state.message)
      };

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _bloc.close();
  }
}
