part of 'booking_cubit.dart';

sealed class BookingState extends Equatable {
  const BookingState();
  @override
  List<Object> get props => [];
}

final class BookingInitial extends BookingState {

}

final class BookingLoading extends BookingState {}

final class BookingSuccess extends BookingState {
  final List<Category> categories;

  const BookingSuccess({required this.categories});
  @override
  List<Object> get props => [categories]; //смотрит нет ли похожих данных
}

final class BookingError extends BookingState {
  final String error;

  const BookingError({required this.error});
  @override
  List<Object> get props => [error];
}