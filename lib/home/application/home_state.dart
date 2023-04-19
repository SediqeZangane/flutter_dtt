import 'package:flutter_dtt/home/domain/model/house_info.dart';

class HomeState {
  final bool isLoad;
  final List<HouseInfo> listHouse;
  final bool isSearching;
  final bool clearText;

  HomeState.init()
      : isLoad = false,
        listHouse = [],
        isSearching = false,
        clearText = false;

  HomeState({
    required this.listHouse,
    required this.isLoad,
    required this.isSearching,
    required this.clearText,
  });

  HomeState copyWith({
    bool? isLoad,
    List<HouseInfo>? listHouse,
    bool? isSearching,
    bool? clearText,
  }) =>
      HomeState(
        isLoad: isLoad ?? this.isLoad,
        listHouse: listHouse ?? this.listHouse,
        isSearching: isSearching ?? this.isSearching,
        clearText: clearText ?? this.clearText,
      );
}
