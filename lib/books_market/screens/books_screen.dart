import 'dart:js_interop';

import 'package:bloc_lessons/booking_app/data/hotel_data.dart';
import 'package:bloc_lessons/books_market/cubit/market_cubit.dart';
import 'package:bloc_lessons/books_market/cubit/show_cubit.dart';
import 'package:bloc_lessons/books_market/screens/detailed_book_screen.dart';
import 'package:bloc_lessons/hotel/data/hotel_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/market_data.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
TextEditingController searchController = TextEditingController();

  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 80), child: _appBar()),
      body: BlocBuilder<MarketCubit, MarketState>(
        builder: (context, state) {
          if (state is MarketLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is MarketError) {
            return Center(
              child: Text('${state.error}'),
            );
          }
          if (state is MarketSuccess) {
            return Column(
              children: [
                _categories(
                    category: state.categories,
                    selectedCategory: state.category),
                const SizedBox(
                  height: 20,
                ),
                _booksCards(books: state.allBooks),
                _bottomNavigationBar(),
              ],
            );
          } else {
            return const Center(
              child: Text('no data'),
            );
          }
        },
      ),
    );
  }

  Widget _appBar() {
    return BlocBuilder<ShowCubit, bool>(
      builder: (context, state) {
        return AppBar(
          title: state
              ? TextField(
            controller: searchController,
            onChanged: (value){
              context.read<MarketCubit>().searchBooks(value);
            },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                )
              : const Text(
                  'Explore Market',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                ),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.notifications_none)),
            IconButton(onPressed: () {
              context.read<ShowCubit>().show();
            }, icon: const Icon(Icons.search)),
          ],
        );
      },
    );
  }

  Widget _categories(
      {required List<Books> category, String? selectedCategory}) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
          itemCount: category.length + 1,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final isAll = index == 0;
            final isSelected = isAll
                ? selectedCategory == null
                : selectedCategory == category[index - 1].id;
            return GestureDetector(
              onTap: () {
                if (isAll) {
                  context.read<MarketCubit>().filterByCategory(null);
                } else {
                  context
                      .read<MarketCubit>()
                      .filterByCategory(category[index - 1].id);
                }
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: 10, left: index == 0 ? 10 : 0),
                width: 100,
                decoration: BoxDecoration(
                  color:
                      isSelected ? const Color(0xFFF5EFE1) : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: isSelected
                          ? const Color(0xFFBFA054)
                          : const Color(0xFFE3D4B5)),
                ),
                child: Text(
                  isAll ? 'All' : category[index - 1].category,
                ),
              ),
            );
          }),
    );
  }

  Widget _booksCards({required List<Datum> books}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: books.isEmpty ? Center(child: Text('no books'),) : GridView.builder(
            itemCount: books.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFF5EFE1),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailedBookScreen(book: books[index])));
                      },
                      child: Image.network(
                        books[index].image,
                        height: 150,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      books[index].name,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    Text(books[index].author,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF858585))),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\￥${books[index].price}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        _button(),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  Widget _button() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        height: 28,
        width: 74,
        color: Colors.black,
        child: const Text(
          'Buy',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
        ),
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return IntrinsicHeight(
      child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          selectedItemColor: const Color(0xFFBFA054),
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: 'home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.bubble_chart),
              label: 'Dial',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmarks_outlined),
              label: 'Bookmarks',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2_outlined,
              ),
              label: 'Profile',
            ),
          ]),
    );
  }
}
