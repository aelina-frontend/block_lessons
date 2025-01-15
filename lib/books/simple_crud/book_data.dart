import 'dart:convert';
import 'package:bloc_lessons/books/simple_crud/data.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class BookData extends StatefulWidget {
  const BookData({super.key});

  @override
  State<BookData> createState() => _BookDataState();
}

class _BookDataState extends State<BookData> {
  TextEditingController nameController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController genreController = TextEditingController();

  Future<List<Books>> getData() async {
    try {
      final response = await http
          .get(Uri.parse('https://67849c811ec630ca33a4e5d5.mockapi.io/books'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Books.fromJson(json)).toList();
      } else {
        throw Exception('ошибка при загрузке данных');
      }
    } catch (e) {
      throw Exception('произошла ошибка $e');
    }
  }

  late Future<List<Books>> data;

  void _fetchData() {
    setState(() {
      data = getData();
    });
  }

  Future<bool> updatePost({required String id, required Books books}) async {
    try {
      final response = await http.put(
          Uri.parse('https://67849c811ec630ca33a4e5d5.mockapi.io/books/$id'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(books.toJson()));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  void updateData({required String id})async{
    final name = nameController.text;
    final author = authorController.text;
    final price = priceController.text;
    final genre = genreController.text;
    if(name.isNotEmpty && author.isNotEmpty && price.isNotEmpty && genre.isNotEmpty){
      final updatedBooks = Books(name: name, author: author, price: int.parse(price), genre: genre);
      final success = await updatePost(id: id, books: updatedBooks);
      if(success){
        Navigator.pop(context);
        _fetchData();
        setState(() {});
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('не смогли обновить')));
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('ошибка ${snapshot.error}'),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text('no data'),
            );
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Количество столбцов
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final post = snapshot.data![index];
                return Container(
                    color: Colors.blue[index * 100],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(post.name),
                        Text(post.author),
                        Text(post.genre),
                        Text('${post.price}'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _iconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return _alertDialog(
                                            text: 'update data',
                                            onPressed: () {
                                              updateData(id: post.id!);
                                            },
                                            textButton: 'update',
                                            content: _content());
                                      });
                                },
                                icon: Icons.edit),
                            _iconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return _alertDialog(
                                            text: 'delete data',
                                            onPressed: () {},
                                            textButton: 'delete');
                                      });
                                },
                                icon: Icons.delete_outline),
                          ],
                        )
                      ],
                    ));
              },
            );
          }
        },
      ),
    );
  }

  Widget _iconButton({required Function() onPressed, required IconData icon}) {
    return IconButton(onPressed: onPressed, icon: Icon(icon));
  }

  Widget _alertDialog(
      {required String text,
      Widget? content,
      required Function() onPressed,
      required String textButton}) {
    return AlertDialog(
      title: Text(text),
      content: content,
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('cancel')),
        TextButton(onPressed: onPressed, child: Text(textButton)),
      ],
    );
  }

  Widget _content() {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          _textField(text: 'name', controller: nameController),
          _textField(text: 'author', controller: authorController),
          _textField(text: 'price', controller: priceController),
          _textField(text: 'genre', controller: genreController),
        ],
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
}
