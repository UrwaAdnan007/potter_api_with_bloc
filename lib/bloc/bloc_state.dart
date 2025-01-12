abstract class PotterState {}

class PotterInitial extends PotterState {}

class PotterLoading extends PotterState {}

class PotterLoaded extends PotterState {
  final List<dynamic> potterdata;
  PotterLoaded(this.potterdata);
}

class PotterError extends PotterState {
  final String errorMessage;
  PotterError(this.errorMessage);
}
