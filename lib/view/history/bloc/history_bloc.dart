import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../networking/services/currency_service.dart';
import 'history_event.dart';
import 'history_state.dart';

@injectable
class HistoryBloc extends Bloc<HistoryEvent, BaseHistoryState> {
  CurrencyService service;

  HistoryBloc(this.service) : super(ProgressState()) {
    on<InitEvent>(_init);
    on<GetCurrencyHistoryEvent>(_getCurrencyHistory);
  }

  void _init(InitEvent event, Emitter<BaseHistoryState> emit) async {
    emit(ProgressState());
  }

  void _getCurrencyHistory(GetCurrencyHistoryEvent event, Emitter<BaseHistoryState> emit) async {
    try {
      emit(ProgressState());
      var result = await service.getCurrencyHistory(event.currency);
      emit(HistoryState().copyWith(currencyList: result));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
