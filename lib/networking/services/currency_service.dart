import 'package:flutter_currency_exchange/models/currency.dart';
import 'package:tuple/tuple.dart';

abstract class CurrencyService {
  Future<Tuple2<String, List<Currency>>> getCurrencyRates();

  Future<List<Currency>> getCurrencyHistory(Currency currency);
}
