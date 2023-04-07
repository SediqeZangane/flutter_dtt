import 'package:flutter_bloc/flutter_bloc.dart';

class CubitNavigationBar extends Cubit<CubitState> {
  CubitNavigationBar() : super(CubitState(0));

  void onItemTapped(int newIndex) {
    emit(CubitState(newIndex));
  }
}

class CubitState {
  final int index;

  CubitState(this.index);
}
