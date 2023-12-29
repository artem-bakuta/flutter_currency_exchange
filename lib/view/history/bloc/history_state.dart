import '../../../models/currency.dart';

sealed class BaseHistoryState {}

class HistoryState extends BaseHistoryState {
  List<Currency> _currencyList = List.empty();

  HistoryState clone() {
    var state = HistoryState();
    state._currencyList = _currencyList;
    return state;
  }

  HistoryState copyWith(
      {String? lastUpdateDate, List<Currency>? currencyList}) {
    if (currencyList != null) _currencyList = currencyList;
    return this;
  }

  List<Currency> get currencyList => _currencyList;

  @override
  List<Object> get props => [_currencyList];
}

class ProgressState extends BaseHistoryState {
  @override
  List<Object> get props => [];
}

class ErrorState extends BaseHistoryState {
  String message;

  ErrorState(this.message);

  @override
  List<Object> get props => [message];
}
