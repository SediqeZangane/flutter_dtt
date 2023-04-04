import 'package:flutter_dtt/home/domain/model/house_model.dart';

class HomeState {
  final bool isLoad;
  final List<HouseModel> listHouse;

  HomeState.init()
      : isLoad = false,
        listHouse = [];

  HomeState({
    required this.listHouse,
    required this.isLoad,
  });

  HomeState copyWith({bool? isLoad, List<HouseModel>? listHouse}) => HomeState(
        isLoad: isLoad ?? this.isLoad,
        listHouse: listHouse ?? this.listHouse,
      );
}
