import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_real_app_state.dart';

class CounterRealAppCubit extends Cubit<CounterRealAppState> {
  CounterRealAppCubit()
      : super(CounterRealAppInitial(
    price: 0,
    name: 'cup',
    isAvailable: true,
  ));

  void changeSum(bool isUp) {
    final currentState = state as CounterRealAppInitial;
    emit(CounterRealAppInitial(
        price: currentState.price + (isUp ? 250 : -250),
        name: currentState.name,
        isAvailable: currentState.isAvailable));
  }

}
