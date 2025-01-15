import 'dart:convert';

import 'package:bloc_lessons/books/simple_crud/data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookCreatScreen extends StatefulWidget {
  const BookCreatScreen({super.key});

  @override
  State<BookCreatScreen> createState() => _BookCreatScreenState();
}

class _BookCreatScreenState extends State<BookCreatScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController genreController = TextEditingController();

  bool isLoading = false;

  Future<bool> addPost({required Books books}) async {
    try {
      final response = await http.post(
          Uri.parse('https://67849c811ec630ca33a4e5d5.mockapi.io/books'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(books.toJson()) //encode преращаем в словарь
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
    final author = authorController.text;
    final price = priceController.text;
    final genre = genreController.text;

    if (name.isEmpty || author.isEmpty || price.isEmpty || genre.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('поля должны быть заполнены'),
        ),
      );
    }
    setState(() {
      isLoading = true;
    });
    final data = Books(name: name, author: author, price: int.parse(price), genre: genre);
    final succes = await addPost(books: data);

    setState(() {
      isLoading = false;
    });
    if(succes){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('не смогли добавить данные'),
        ),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              _textField(text: 'name', controller: nameController),
              _textField(text: 'author', controller: authorController),
              _textField(text: 'price', controller: priceController),
              _textField(text: 'genre', controller: genreController),
              _button(onPressed: () {
                createData();
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textField(
      {required String text, required TextEditingController controller}) {
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
      child: isLoading ? const CircularProgressIndicator() : const Text(
          'create data'),
    );
  }
}
