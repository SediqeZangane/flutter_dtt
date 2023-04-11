import 'package:geolocator/geolocator.dart';

class LocationUtils {
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  double calculateDistance(LatLng currentPos, LatLng housePos) {
    double distanceInMeters = Geolocator.distanceBetween(currentPos.lat,
        currentPos.lng, housePos.lat, housePos.lng);
    return distanceInMeters;
  }
}

class LatLng{
  final double lat;
  final double lng;

  LatLng(this.lat, this.lng);
}
