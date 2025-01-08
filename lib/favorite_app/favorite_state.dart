part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {
  final bool isLike;

  FavoriteInitial({required this.isLike});
}
