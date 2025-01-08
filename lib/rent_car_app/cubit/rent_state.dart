part of 'rent_cubit.dart';

@immutable
sealed class RentState {}

final class RentInitial extends RentState {
}

final class RentLoading extends RentState {}

final class RentSuccess extends RentState {

  final List<Map<String, dynamic>> cars;
  RentSuccess({required this.cars});
}

final class RentError extends RentState {
  final String error;

  RentError({required this.error});
}


