import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  Position? currentPosition;
  Position? liveLocation;

  String? currentAddress;
  LocationService() {
    getCurrentLocation();
  }

  Future getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((position) {
      currentPosition = position;

      getAddress;
    }).catchError((e) {
      print(e);
    });

    Geolocator.getPositionStream().listen((event) {
      liveLocation = event;
      Future.delayed(Duration(seconds: 4), () {});
    });
  }

  void get getAddress async {
    try {
      var p = await placemarkFromCoordinates(
          currentPosition!.latitude, currentPosition!.longitude);

      var place = p[0];

      currentAddress = '${place.locality},\n${place.administrativeArea}';
    } catch (e) {
      print(e);
    }
  }
}
