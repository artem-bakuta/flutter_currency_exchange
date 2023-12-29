import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_currency_exchange/view/dashboard/bloc/dashboard_state.dart';

import '../../../../generated/l10n.dart';
import '../../history/history_screen.dart';

class DashboardWidget extends StatefulWidget {
  DashboardState stateValue;

  DashboardWidget(this.stateValue, {super.key});

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Center(child: Text(S.of(context).lastUpdate)),
      Center(
          child: Text(widget.stateValue.lastUpdateDate,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.orange))),
      Expanded(
          child: ListView.builder(
        itemCount: widget.stateValue.currencyList.length,
        itemBuilder: (BuildContext context, int index) {
          var item = widget.stateValue.currencyList[index];
          return ListTile(
            title: InkWell(
                child: Column(children: [
                  Text(item.key),
                  Text(item.name),
                  Text(item.exchange.toString()),
                  const Divider()
                ]),
                onTap: () => {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HistoryScreen(item)))
                    }),
          );
        },
      ))
    ]);
  }
}
