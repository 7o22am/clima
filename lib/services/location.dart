import 'package:geolocator/geolocator.dart';
class Location {

  double latitiude =0.0;
  double longitude =0.0;

  Future<void> GetCurrenLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      latitiude = position.latitude;
      longitude = position.longitude;

    } on Exception catch (e) {
      print(e);
    }
  }
}