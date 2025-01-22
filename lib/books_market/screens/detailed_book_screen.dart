import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../booking_app/core/app_colors.dart';
import '../data/market_data.dart';

class DetailedBookScreen extends StatelessWidget {
  final Datum book;

  const DetailedBookScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            _image(),
            SizedBox(
              height: 20,
            ),
            _titlePrice(),
            SizedBox(
              height: 20,
            ),
            _containers(),
            SizedBox(
              height: 20,
            ),
            _categories2(),
            _divider(),
            SizedBox(
              height: 20,
            ),
            _text(),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _button(text: 'Start Reading', icon: Icons.menu_book),
                _button(text: 'Play Audio', icon: Icons.play_circle_outline),
              ],
            )
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text(
        'Book info',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
      ),
      actions: [
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.bookmarks_outlined)),
      ],
    );
  }

  Widget _image() {
    final int selectedIndex = 0;
    final index = selectedIndex;
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(
            book.image,
          ),
        )
      ),
    );
  }

  Widget _titlePrice() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          book.name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(book.author,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF858585))),
            Text(
              '\￥${book.price}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ],
    );
  }

  Widget _containers() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
            height: 70,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFBFA054)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Released'), Text('2021')],
            )),
        Container(
            height: 70,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFBFA054)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Part'), Text('16')],
            )),
        Container(
            height: 70,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFBFA054)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Pages'), Text('360')],
            )),
      ],
    );
  }

  Widget _categories2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Synopsis'),
        Text('Details'),
        Text('Author'),
        Text('Review'),
      ],
    );
  }

  Widget _divider() {
    return const Divider(
      color: AppColors.grey,
      thickness: 0.5,
    );
  }

  Widget _text() {
    return Text(
      'With fair-tressed Demeter, the sacred goddess, my song begins, With herself and her slim-ankled daughter, whom Aidoneus once Abducted...Most people are familiar, at least by repute, with the two great epics of Homer,'
      ' the Iliad and the Odyssey, but few are aware that other poems survive that were attributed to Homer in ancient times.',
      style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xFF858585)),
    );
  }

  Widget _button({required String text, required IconData icon}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        height: 46,
        width: 160,
        color: Color(0xFFBFA054),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icon),
            Text(
              text,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
