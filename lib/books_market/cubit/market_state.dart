part of 'market_cubit.dart';

sealed class MarketState extends Equatable {
  const MarketState();

  @override
  List<Object?> get props => [];
}

final class MarketInitial extends MarketState {}

final class MarketLoading extends MarketState {}

final class MarketSuccess extends MarketState {
  final List<Books> categories;
  final List<Datum> allBooks;
  final String? category;

  const MarketSuccess({required this.categories, required this.allBooks, this.category});

  @override
  List<Object?> get props => [categories, allBooks, category];
}

final class MarketError extends MarketState {
  final String error;

  const MarketError({required this.error});

  @override
  List<Object?> get props => [error];
}
