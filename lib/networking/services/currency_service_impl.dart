import 'package:flutter_currency_exchange/db/db_helper.dart';
import 'package:flutter_currency_exchange/networking/services/currency_service.dart';
import 'package:tuple/tuple.dart';

import '../../models/currency.dart';
import '../api/api.dart';
import '../apiclient/api_client.dart';
import '../models/currency_response.dart';
import '../utils/date.dart';
import '../utils/utils.dart';

class CurrencyServiceImpl extends CurrencyService {
  ApiClient apiClient;
  DbHelper dbHelper;

  CurrencyServiceImpl(this.apiClient, this.dbHelper);

  @override
  Future<Tuple2<String, List<Currency>>> getCurrencyRates() async {
    var response = await apiClient.get(GET_CURRENCY_RATES);
    var currencyResponse = CurrencyResponse.fromJson(NetworkUtils.returnResponse(response));

    List<Currency> currencies = currencyResponse.currencies
            ?.map((e) => Currency(e.key ?? "", e.name ?? "", e.exchange ?? 0.0))
            .toList() ??
        List.empty();

    var formatYMED = DataTimeUtils.formatYMED(currencyResponse.timestamp);

    for (var element in currencies) {
      dbHelper.insert(element);
    }

    return Tuple2(formatYMED, currencies);
  }

  @override
  Future<List<Currency>> getCurrencyHistory(Currency currency) async {
    return await dbHelper.getCurrencyHistory(currency);
  }
}
