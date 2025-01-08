import 'package:bloc_lessons/string_app/string_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StringScreen extends StatefulWidget {
  const StringScreen({super.key});

  @override
  State<StringScreen> createState() => _StringScreenState();
}

class _StringScreenState extends State<StringScreen> {

  TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: textController,
          decoration: const InputDecoration(
            border: OutlineInputBorder()
          ),
        ),
      ),
      body: Center(
        child: BlocBuilder<StringCubit, String>(builder: (context, text){
          return Text(text);
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){context.read<StringCubit>().changeText(text: textController.text);},
        child: Icon(Icons.add),
      ),
    );
  }
}
