import 'package:bloc_lessons/task_app/task_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  TextEditingController _addController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          if (state is TaskLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TaskError) {
            return const Center(
              child: Text('не смогли загрузить данные'),
            );
          } else if (state is TaskInitial) {
            return const Center(
              child: Text('нету задач'),
            );
          } else if (state is TaskSuccess) {
            return ListView.builder(
                itemCount: state.tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.tasks[index]),
                    trailing: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return alertDialogWidget(
                                    title: 'Вы действительно хотите удалить?',
                                    name1: 'нет',
                                    name2: 'удалить',
                                    onPressed: () {
                                      context
                                          .read<TaskCubit>()
                                          .deleteTask(index: index);
                                      Navigator.pop(context);
                                    });
                              });
                        },
                        icon: Icon(Icons.delete_outline)),
                    leading: IconButton(
                      onPressed: (){
                        showDialog(context: context, builder: (context){
                          _addController.text = state.tasks[index];
                          return alertDialogWidget(
                              isShow: true,
                              controller: _addController,
                              title: 'update task',
                              name1: 'no',
                              name2: 'update',
                              onPressed: (){
                            context.read<TaskCubit>().updateTask(oldTask: state.tasks[index], newTask: _addController.text);
                            Navigator.pop(context);
                            _addController.clear();
                          });
                        });
                      },
                        icon: Icon(Icons.edit),
                    ),
                  );
                });
          } else {
            return const Center(
              child: Text('произошла неизвестная ошибка'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<TaskCubit>().loadingTask();
        },
        child: Icon(Icons.access_time_outlined),
      ),
    );
  }

  Widget alertDialogWidget({
    required String title,
    bool isShow = false,
    TextEditingController? controller,
    required String name1,
    required String name2,
    required dynamic Function() onPressed,
  }) {
    return AlertDialog(
      title: Text(title),
      content: Visibility(
        visible: isShow,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(name1),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(name2),
        ),
      ],
    );
  }
}
