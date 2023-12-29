import 'package:flutter/material.dart';
import 'package:flutter_currency_exchange/view/history/bloc/history_state.dart';

class HistoryWidget extends StatefulWidget {
  HistoryState stateValue;

  HistoryWidget(this.stateValue, {super.key});

  @override
  State<HistoryWidget> createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: ListView.builder(
        itemCount: widget.stateValue.currencyList.length,
        itemBuilder: (BuildContext context, int index) {
          var item = widget.stateValue.currencyList[index];
          return ListTile(
            title: Column(children: [
              Text(item.key),
              Text(item.name),
              Text(item.exchange.toString()),
              const Divider()
            ]),
          );
        },
      ))
    ]);
  }
}
