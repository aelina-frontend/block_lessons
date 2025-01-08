part of 'test_bloc.dart';

@immutable
sealed class TestEvent {}
final class LoadEvent extends TestEvent {}
final class LikeEvent extends TestEvent {}
final class BookEvent extends TestEvent {}
final class SearchEvent extends TestEvent {}
final class FilterByPriceEvent extends TestEvent {}
