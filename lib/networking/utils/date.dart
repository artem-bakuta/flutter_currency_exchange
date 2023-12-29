import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class DataTimeUtils {
  static String formatYMED(int? timestamp) {
    initializeDateFormatting();
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp ?? 0);
    final timeFormat = DateFormat.yMMMMEEEEd().format(date);
    return timeFormat;
  }
}
