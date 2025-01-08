import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial(isLike: false));

  void like(){
    final currentState = state as FavoriteInitial;
    emit(FavoriteInitial(isLike: !currentState.isLike));
  }
}
