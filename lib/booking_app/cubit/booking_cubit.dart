import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/hotel_data.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());

  void loadHotels() {
    try {
      emit(BookingLoading());
      if (categories.isNotEmpty) {
        Future.delayed(const Duration(seconds: 1), () {
          final int index = categories.length - 1;
          print(index);

          emit(BookingSuccess(categories: categories));
        });
      } else {
        emit(const BookingError(error: "Мы не смогли загрузить данные"));
      }
    }
    catch (e) {
      emit(BookingError(error: 'Произошла ошибка $e'));
    }
  }

  void isLike(String category, int id) {
    final currentState = state;
    if (currentState is BookingSuccess) {
      final updatedCategories = currentState.categories.map((cat) {
        if (cat.category == category) {
          return Category(
            category: cat.category,
            data: cat.data.map((hotel) {
              if (hotel.id == id) {
                return HotelData(
                  id: hotel.id,
                  title: hotel.title,
                  price: hotel.price,
                  rooms: hotel.rooms,
                  square: hotel.square,
                  image: hotel.image,
                  isLike: !hotel.isLike, // Toggle the like
                  rating: hotel.rating,
                );
              }
              return hotel;
            }).toList(),
          );
        }
        return cat;
      }).toList();
      emit(BookingSuccess(categories: updatedCategories,));
    }

  }
}
