part of 'counter_real_app_cubit.dart';

@immutable
sealed class CounterRealAppState {}

final class CounterRealAppInitial extends CounterRealAppState {
  final int price;
  final String name;
  final bool isAvailable;

  CounterRealAppInitial({required this.price, required this.name, required this.isAvailable});

}
