
import 'package:bloc/bloc.dart';

class StringCubit extends Cubit<String>{
  StringCubit() : super('你好吗');

  void changeText({ required String text}){
    emit(text);
  }
}