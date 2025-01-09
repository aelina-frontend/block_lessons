import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/hotel_data.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());

  void loadHotels(){
    try{
      emit(BookingLoading());
     if(categories.isNotEmpty){
       Future.delayed(const Duration(seconds: 1), (){

         final int index = categories.length-1;
         print(index);

         emit(BookingSuccess(categories: categories, listIndex: index));
       });
     }else{
       emit(const BookingError(error: "Мы не смогли загрузить данные"));
     }
    }
    catch(e){
      emit(BookingError(error: 'Произошла ошибка $e'));
    }
  }

  void isLike(){
    final currentState = state;
    if(currentState is BookingSuccess){
      final updateProduct = currentState.categories.map((item){
        if(item.data.){}
      });
    }
  }
}
