import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../data/market_data.dart';

part 'market_state.dart';

class MarketCubit extends Cubit<MarketState> {
  MarketCubit() : super(MarketInitial());

  List<Books> categories = [];
  List<Datum> allBooks = [];

  Future<void> getData() async {
    emit(MarketLoading());

    try {
      final url =
          Uri.parse('https://67849c811ec630ca33a4e5d5.mockapi.io/books');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        categories = (json.decode(response.body) as List)
            .map((item) => Books.fromJson(item))
            .toList();
        allBooks = categories.expand((item) => item.data).toList();
        emit(MarketSuccess(categories: categories, allBooks: allBooks));
      } else {
        emit(MarketError(
            error: 'ошибка при загрузке данных ${response.statusCode}'));
      }
    } catch (e) {
      emit(MarketError(error: 'произошла ошибка $e'));
    }
  }

  void filterByCategory(String? categoryId) {
    try {
      if (categoryId == null) {
        final allBooks = categories.expand((item) => item.data).toList();
        emit(MarketSuccess(categories: categories, allBooks: allBooks));
      } else {
        final selectedCategory =
            categories.firstWhere((item) => item.id == categoryId);
        emit(MarketSuccess(
            categories: categories,
            allBooks: selectedCategory.data,
            category: categoryId));
      }
    } catch (e) {
      emit(MarketError(error: 'нет данных ${e}'));
    }
  }

  void searchBooks(String query) {
    if (query.isEmpty) {
      emit(MarketSuccess(categories: categories, allBooks: allBooks));
    } else {
      final filteredBooks = allBooks
          .where(
              (item) => item.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      emit(MarketSuccess(categories: categories, allBooks: filteredBooks));
    }
  }
}
