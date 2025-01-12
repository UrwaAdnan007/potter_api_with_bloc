import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:potter_api_bloc/bloc/bloc_events.dart';
import 'package:potter_api_bloc/bloc/bloc_state.dart';
import 'package:potter_api_bloc/potter/api_service.dart';
import 'package:potter_api_bloc/potter/model.dart';

class PotterBloc extends Bloc<PotterEvent, PotterState> {
  final ApiService apiService;
  PotterBloc(this.apiService) : super(PotterInitial()) {
    on<FetchPottersEvent>((event, emit) async {
      emit(PotterLoading());
      try {
        final List<PotterModel> potterdata = await apiService.fetchData();
        emit(PotterLoaded(potterdata));
      } catch (e) {
        emit(PotterError(e.toString()));
      }
    });
  }
}
