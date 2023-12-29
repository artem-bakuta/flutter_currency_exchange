// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../db/db_helper.dart' as _i3;
import '../networking/apiclient/api_client.dart' as _i4;
import '../networking/services/currency_service.dart' as _i5;
import '../view/dashboard/bloc/dashboard_bloc.dart' as _i6;
import '../view/history/bloc/history_bloc.dart' as _i7;
import 'modules/data_modules.dart' as _i8;
import 'modules/network_modules.dart' as _i9;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final dataModule = _$DataModule();
  final networkModule = _$NetworkModule();
  gh.factory<_i3.DbHelper>(() => dataModule.getDbHelper());
  gh.factory<String>(
    () => networkModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.factory<_i4.ApiClient>(
      () => networkModule.getApiClient(gh<String>(instanceName: 'BaseUrl')));
  gh.factory<_i5.CurrencyService>(() => networkModule.getReportingService(
        gh<_i4.ApiClient>(),
        gh<_i3.DbHelper>(),
      ));
  gh.factory<_i6.DashboardBloc>(
      () => _i6.DashboardBloc(gh<_i5.CurrencyService>()));
  gh.factory<_i7.HistoryBloc>(() => _i7.HistoryBloc(gh<_i5.CurrencyService>()));
  return getIt;
}

class _$DataModule extends _i8.DataModule {}

class _$NetworkModule extends _i9.NetworkModule {}
