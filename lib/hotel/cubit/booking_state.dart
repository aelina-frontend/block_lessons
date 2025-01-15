part of 'booking_cubit.dart';

sealed class BookingState extends Equatable {
  const BookingState();
  @override
  List<Object> get props => [];
}

final class BookingInitial extends BookingState {}

final class BookingLoading extends BookingState {}

final class BookingSuccess extends BookingState {
  final List<Category> categories;
  final List<Category> filteredData;

  const BookingSuccess({required this.categories, required this.filteredData});

  @override
  List<Object> get props => [categories, filteredData];
}

final class BookingError extends BookingState {
  final String error;

  const BookingError({required this.error});

  @override
  List<Object> get props => [error];
}