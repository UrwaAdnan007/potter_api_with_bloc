import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:potter_api_bloc/bloc/bloc_events.dart';
import 'package:potter_api_bloc/potter_bloc/potter_state.dart';
import 'package:potter_api_bloc/service/potter_api_service.dart';
import 'package:potter_api_bloc/data/potter_model.dart';

//////// BLOC with Event

// class PotterBloc extends Bloc<PotterEvent, PotterState> {
//   final ApiService apiService;
//   PotterBloc(this.apiService) : super(PotterInitial()) {
//     on<FetchPottersEvent>((event, emit) async {
//       emit(PotterLoading());
//       try {
//         final List<PotterModel> potterdata = await apiService.fetchData();
//         emit(PotterLoaded(potterdata));
//       } catch (e) {
//         emit(PotterError(e.toString()));
//       }
//     });
//   }
// }

/// BLOC with Cubit

class PotterBloc extends Cubit<PotterState> {
  final ApiService apiService;
  PotterBloc(this.apiService) : super(PotterInitial());

  void attemptToFetchPotterData() async {
    try {
      emit(PotterLoading());
      final List<PotterModel> potterdata = await apiService.fetchData();
      emit(PotterLoaded(potterdata: potterdata));
    } catch (e) {
      emit(PotterError(errorMessage: e.toString()));
    }
  }
}
