import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../networking/services/currency_service.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

@injectable
class DashboardBloc extends Bloc<DashboardEvent, BaseDashBoardState> {
  CurrencyService service;

  DashboardBloc(this.service) : super(InitState()) {
    on<InitEvent>(_init);
    on<GetCurrencyRatesEvent>(_getRatesFromServer);
  }

  void _init(InitEvent event, Emitter<BaseDashBoardState> emit) async {
    emit(InitState());
  }

  void _getRatesFromServer(GetCurrencyRatesEvent event, Emitter<BaseDashBoardState> emit) async {
    try {
      var result = await service.getCurrencyRates();
      emit(DashboardState().copyWith(lastUpdateDate: result.item1, currencyList: result.item2));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
