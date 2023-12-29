import '../../../models/currency.dart';

sealed class BaseDashBoardState {
}

class DashboardState extends BaseDashBoardState {
  String _lastUpdateDate = "";
  List<Currency> _currencyList = List.empty();

  DashboardState clone() {
    var state = DashboardState();
    state._currencyList = _currencyList;
    state._lastUpdateDate = _lastUpdateDate;
    return state;
  }

  BaseDashBoardState copyWith(
      {String? lastUpdateDate,
      List<Currency>? currencyList,
      bool isProgress = false}) {
    if (lastUpdateDate != null) _lastUpdateDate = lastUpdateDate;
    if (currencyList != null) _currencyList = currencyList;
    return this;
  }

  List<Currency> get currencyList => _currencyList;

  String get lastUpdateDate => _lastUpdateDate;

  @override
  List<Object> get props => [_lastUpdateDate, _currencyList];
}

class InitState extends BaseDashBoardState {
  @override
  List<Object> get props => [];
}

class ErrorState extends BaseDashBoardState {
  String message;

  ErrorState(this.message);

  @override
  List<Object> get props => [message];
}
