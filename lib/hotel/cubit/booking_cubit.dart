import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/hotel_data.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final List<Category> categories;

  BookingCubit({required this.categories}) : super(BookingLoading());

  // Initial loading of all data
  void loadHotels() {
    emit(BookingSuccess(categories: categories, filteredData: categories));
  }

  // Filter hotels by category
  void filterByCategory(String category) {
    if (category == 'All') {
      emit(BookingSuccess(categories: categories, filteredData: categories));
    } else {
      final filtered = categories
          .where((c) => c.category == category)
          .toList();
      emit(BookingSuccess(categories: categories, filteredData: filtered));
    }
  }

  // Toggle like status
  void toggleLike(int hotelId) {
    if (state is BookingSuccess) {
      final currentState = state as BookingSuccess;
      final updatedCategories = currentState.categories.map((category) {
        return category.copyWith(
          data: category.data.map((hotel) {
            if (hotel.id == hotelId) {
              return hotel.copyWith(isLike: !hotel.isLike);
            }
            return hotel;
          }).toList(),
        );
      }).toList();

      emit(BookingSuccess(categories: updatedCategories, filteredData: updatedCategories));
    }
  }


  // Search hotels by title
  void searchHotels(String query) {
    final filtered = categories.map((category) {
      final filteredData = category.data
          .where((hotel) => hotel.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
      return Category(category: category.category, data: filteredData);
    }).toList();
    emit(BookingSuccess(categories: categories, filteredData: filtered));
  }
}
