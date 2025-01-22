import 'package:bloc/bloc.dart';


class ShowCubit extends Cubit<bool> {
  ShowCubit() : super(false);

  void show(){
    emit(!state);
  }


}
