import 'package:potter_api_bloc/data/potter_model.dart';

abstract class PotterState {}

class PotterInitial extends PotterState {}

class PotterLoading extends PotterState {}

class PotterLoaded extends PotterState {
  final List<PotterModel> potterdata;
  PotterLoaded({required this.potterdata});
}

class PotterError extends PotterState {
  final String errorMessage;
  PotterError({required this.errorMessage});
}
