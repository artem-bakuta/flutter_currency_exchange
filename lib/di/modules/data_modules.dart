import 'package:flutter_currency_exchange/db/db_helper.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DataModule {
  @injectable
  DbHelper getDbHelper() => DbHelper.instance;
}
