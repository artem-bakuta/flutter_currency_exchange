import 'package:flutter_currency_exchange/models/currency.dart';

sealed class DashboardEvent {}

class InitEvent extends DashboardEvent {}

class GetCurrencyRatesEvent extends DashboardEvent {}