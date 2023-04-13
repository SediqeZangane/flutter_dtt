import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dtt/home/application/dio_client.dart';
import 'package:flutter_dtt/home/application/home_event.dart';
import 'package:flutter_dtt/home/application/home_state.dart';
import 'package:flutter_dtt/home/application/location_utils.dart';
import 'package:flutter_dtt/home/domain/model/house_model.dart';
import 'package:geolocator/geolocator.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DioClient dioClient = DioClient();

  List<HouseModel> listHouse = [];
  LocationUtils locationUtils = LocationUtils();

  HomeBloc() : super(HomeState.init()) {
    on<HomeEvent>((event, emit) async {
      if (event is LoadHomeEvent) {
        emit(state.copyWith(isLoad: true));
        listHouse = await dioClient.getHouse();
        final currentLocation = await _getCurrentLocation();
        if (currentLocation != null) {
          listHouse = listHouse.map((e) {
            final distance = locationUtils.calculateDistance(
                LatLng(currentLocation.latitude, currentLocation.longitude),
                LatLng(e.latitude, e.longitude));
            e.distance = distance;
            return e;
          }).toList();
        }
        listHouse.sort((a, b) => b.price - a.price);

        emit(state.copyWith(isLoad: false, listHouse: listHouse));
      }

      if (event is SearchHomeEvent) {
        final list = listHouse
            .where((element) =>
                element.city.contains(event.searchText) ||
                element.zip.contains(event.searchText))
            .toList();
        emit(state.copyWith(
          listHouse: list,
          isSearching: event.searchText.isNotEmpty,
        ));
      }
    });
  }

  Future<Position?> _getCurrentLocation() async {
    try {
      final position = await locationUtils.determinePosition();
      return position;
    } catch (_) {
      return null;
    }
  }
}
