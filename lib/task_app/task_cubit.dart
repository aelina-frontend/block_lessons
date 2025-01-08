import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState>{
  TaskCubit() : super(TaskInitial()){
    loadingTask();
  }

  void loadingTask(){
    emit(TaskLoading());
    Future.delayed(const Duration(seconds: 1),(){
      emit(TaskSuccess(tasks: const ['learn flutter', 'sleep', 'buy something']),);
    });
  }

  void deleteTask({required int index}){

    if(state is TaskSuccess){
      final tasks = List<String>.from((state as TaskSuccess).tasks)..removeAt(index);
      emit(tasks.isEmpty ? TaskInitial() : TaskSuccess(tasks: tasks));
    }
  }

  void updateTask({required String oldTask, required String newTask }){

  if(state is TaskSuccess){
    final currentState = state as TaskSuccess;
    final updateTask = currentState.tasks.map((item){
      return item == oldTask ? newTask : item;
    }).toList();
    emit(TaskSuccess(tasks: updateTask));
  }
  }


}
