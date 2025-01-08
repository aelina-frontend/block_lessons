part of 'task_cubit.dart';

@immutable
sealed class TaskState {}

// 4 состояния: при запуске, загружатся, успешно загрузился и неправильно загрузился
final class TaskInitial extends TaskState {
  // никакими данными не работает
}

final class TaskLoading extends TaskState {
  // иконка крутится, никакими данными не работает, процесс загрузки
}

final class TaskSuccess extends TaskState {
  final List<String> tasks;

  TaskSuccess({required this.tasks});
}

final class TaskError extends TaskState {
  final String error;

  TaskError({required this.error});
}




// List<String> dresses = [
//   'red dress',
//   'rusalka',
//   'princess dress',
//   'black dress'
// ];
//
// class Person {
//   final String name;
//   final int age;
//   final bool isAdult;
//   final double weight;
//   final Color hearColor;
//   final Map<String, dynamic> characters;
//   final List<String> clothes;
//
//   Person(
//       {required this.name,
//       required this.age,
//       required this.isAdult,
//       required this.weight,
//       required this.hearColor,
//       required this.characters,
//       required this.clothes});
// }
