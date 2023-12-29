import 'package:flutter_currency_exchange/db/db_helper.dart';
import 'package:flutter_currency_exchange/networking/services/currency_service_impl.dart';
import 'package:injectable/injectable.dart';

import '../../networking/api/api.dart';
import '../../networking/apiclient/api_client.dart';
import '../../networking/services/currency_service.dart';

@module
abstract class NetworkModule {
  @Named("BaseUrl")
  String get baseUrl => BASE_URL;

  ApiClient getApiClient(@Named("BaseUrl") String url) => ApiClient(url);

  @injectable
  CurrencyService getReportingService(ApiClient httpClient, DbHelper dbHelper) =>
      CurrencyServiceImpl(httpClient, dbHelper);
}
