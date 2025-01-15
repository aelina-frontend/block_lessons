import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'data.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController avatarController = TextEditingController();

  bool isLoading = false;

  Future<bool> addPost({required Users users}) async {
    try {
      final response = await http.post(
          Uri.parse('https://67849c811ec630ca33a4e5d5.mockapi.io/users'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(users.toJson()) //encode преращаем в словарь//отправляем
          );
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<void> createData() async {
    final name = nameController.text;
    final surname = surnameController.text;
    final numbers = numberController.text;
    final avatar = avatarController.text;
    if (name.isEmpty || surname.isEmpty || numbers.isEmpty || avatar.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('поля должны быть заполнены'),
        ),
      );
    }
    setState(() {
      isLoading = true;
    });
    final data = Users(
        name: name,
        surname: surname,
        numbers: int.parse(numbers),
        avatar: avatar);
    final success = await addPost(users: data);
    // пока загружается кнопка false, а загрузка true

    setState(() {
      isLoading = false;
    });
    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('данные добавлены'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('не смогли добавить данные'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              _textField(text: 'name', controller: nameController),
              _textField(text: 'surname', controller: surnameController),
              _textField(text: 'number', controller: numberController),
              _textField(text: 'avatar', controller: avatarController),
              _button(onPressed: () {
                createData();
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textField({required String text, required TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: text,
        ),
      ),
    );
  }

  Widget _button({
    required Function() onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      child: isLoading ? const CircularProgressIndicator() : const Text('create data'),
    );
  }
}
