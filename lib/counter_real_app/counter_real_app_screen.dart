import 'package:bloc_lessons/counter_real_app/counter_real_app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterRealAppScreen extends StatefulWidget {
  const CounterRealAppScreen({super.key});

  @override
  State<CounterRealAppScreen> createState() => _CounterRealAppScreenState();
}

class _CounterRealAppScreenState extends State<CounterRealAppScreen> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: nameController,
          decoration: const InputDecoration(
              border: OutlineInputBorder()
          ),
        ),
      ),
      body: Center(
        child: BlocBuilder<CounterRealAppCubit, CounterRealAppState>(builder: (context, state){
          state as CounterRealAppInitial;
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(nameController.text),
              Text('${state.price}'),
            ],
          );
        }),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: (){
              context.read<CounterRealAppCubit>().changeSum(false);
            },
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: (){
              context.read<CounterRealAppCubit>().changeSum(true);
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
