import 'package:flutter_currency_exchange/models/currency.dart';

sealed class HistoryEvent {}

class InitEvent extends HistoryEvent {}

class GetCurrencyHistoryEvent extends HistoryEvent {
  Currency currency;

  GetCurrencyHistoryEvent(this.currency);
}
