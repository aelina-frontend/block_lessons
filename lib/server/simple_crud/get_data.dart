import 'dart:convert';
import 'package:bloc_lessons/server/simple_crud/create_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'data.dart';

class GetData extends StatefulWidget {
  const GetData({super.key});

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController numbersController = TextEditingController();
  TextEditingController avatarController = TextEditingController();

  Future<List<Users>> getData() async {
    try {
      final response = await http
          .get(Uri.parse('https://67849c811ec630ca33a4e5d5.mockapi.io/users'));
      if (response.statusCode == 200) {
        final List<dynamic> data =
            json.decode(response.body); //decode распаковка объекта, получаем
        return data.map((json) => Users.fromJson(json)).toList();
      } else {
        throw Exception('ошибка при загрузке данных');
      }
    } catch (e) {
      throw Exception('произошла ошибка $e');
    }
  }

  late Future<List<Users>> data;

  void _fetchData() {
    setState(() {
      data = getData();
    });
  }

  Future<bool> updatePost({required String id, required Users users}) async {
    try {
      final response = await http.put(
          Uri.parse('https://67849c811ec630ca33a4e5d5.mockapi.io/users/$id'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(users.toJson()));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  void updateData({required String id}) async {
    final name = nameController.text;
    final surname = surnameController.text;
    final numbers = numbersController.text;
    final avatar = avatarController.text;
    if (name.isNotEmpty &&
        surname.isNotEmpty &&
        numbers.isNotEmpty &&
        avatar.isNotEmpty) {
      final updatedUsers = Users(
          name: name,
          surname: surname,
          numbers: int.parse(numbers),
          avatar: avatar);
      final success = await updatePost(id: id, users: updatedUsers);
      if (success) {
        Navigator.pop(context);
        _fetchData();
        setState(() {});
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('не смогли обновить')));
      }
    }
  }

  Future<bool> deleteData({required String id}) async {
    try {
      final response = await http.delete(
        Uri.parse('https://67849c811ec630ca33a4e5d5.mockapi.io/users/$id'),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200 || response.statusCode == 204) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
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
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final post = snapshot.data![index];
                    return ListTile(
                      leading: const CircleAvatar(
                          radius: 30,
                          foregroundImage: NetworkImage(
                              'https://i.postimg.cc/FsV05mhG/venom.jpg')),
                      title: Text('${post.name} ${post.surname}'),
                      subtitle: Text('${post.numbers}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _iconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return _alertDialog(
                                          text: 'update data',
                                          textButton: 'update',
                                          content: _content(),
                                          onPressed: () {
                                            updateData(id: post.id!);
                                          });
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
                                          textButton: 'delete',
                                          onPressed: () async{
                                            await deleteData(id: post.id!);
                                            Navigator.pop(context);
                                            _fetchData();
                                          });
                                    });
                              },
                              icon: Icons.delete_outline),
                        ],
                      ),
                    );
                  });
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CreateScreen()))
              .then((dynamic) {
            setState(() {
              _fetchData();
            });
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _iconButton({required Function() onPressed, required IconData icon}) {
    return IconButton(onPressed: onPressed, icon: Icon(icon));
  }

  Widget _alertDialog(
      {required String text,
      Widget? content,
      required String textButton,
      required Function() onPressed}) {
    return AlertDialog(
      title: Text(text),
      content: content,
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('cancel')),
        TextButton(
          onPressed: onPressed,
          child: Text(textButton),
        )
      ],
    );
  }

  Widget _content() {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          _textField(text: 'name', controller: nameController),
          _textField(text: 'surname', controller: surnameController),
          _textField(text: 'avatar', controller: avatarController),
          _textField(text: 'numbers', controller: numbersController),
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
