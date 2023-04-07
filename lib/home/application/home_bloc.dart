import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dtt/home/application/dio_client.dart';
import 'package:flutter_dtt/home/application/home_event.dart';
import 'package:flutter_dtt/home/application/home_state.dart';
import 'package:flutter_dtt/home/domain/model/house_model.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DioClient dioClient = DioClient();

  List<HouseModel> listHouse=[];

  HomeBloc() : super(HomeState.init()) {
    on<HomeEvent>((event, emit) async {
      if (event is LoadHomeEvent) {
        emit(state.copyWith(isLoad: true));
       listHouse = await dioClient.getHouse();
        emit(state.copyWith(isLoad: false, listHouse: listHouse));
      }

      if (event is SearchHomeEvent) {
        final list = listHouse
            .where((element) => element.description.contains(event.searchText))
            .toList();
        emit(state.copyWith(listHouse: list));
      }
    });
  }
}