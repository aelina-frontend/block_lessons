import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/cars_data.dart';

part 'rent_state.dart';

class RentCubit extends Cubit<RentState> {
  RentCubit() : super(RentInitial()){
    loadCars();
  }

  Future<void> loadCars()async{
    emit(RentLoading());
    try{
      await Future.delayed(const Duration(seconds: 1));
      emit(RentSuccess(cars: cars));
    }catch(e){
      emit(RentError(error: 'Не смогли загрузить данные'));
    }
  }

  void isLIke(int index){
    if(state is RentSuccess){ //нужно указать какое состояние
      final currentState = state as RentSuccess; //обращаемся к конткретной дочери, в которой хочу менять данные
      final updateCars = currentState.cars.map((item){ //создаем переменные, map это метод списка
        if(item['id'] == index){                       //условие пишем, конкретно какой менять
          return {
            ...item, 'isLike' : !item['isLike']          ///... означает вернуть все НЕ измененные данные
          };
        }
        return item;
      }).toList();
      emit(RentSuccess(cars: updateCars));
    }
  }

  void searchByBrand(String name){
    if(state is RentSuccess){
      final currentState = state as RentSuccess;
      final filterCards = currentState.cars.where((item){
        return item['brand'].toString().toLowerCase().contains(name.toLowerCase());
      }).toList();
      emit(RentSuccess(cars: filterCards));
    }else if(name.isEmpty){
      emit(RentSuccess(cars: cars));
    }
  }
}
