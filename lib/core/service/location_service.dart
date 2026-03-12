import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:islamic/features/home/data/models/location_models.dart';

class LocationService {
  Future<LocationModels> getLocationData({String? locale}) async {
    /// check location service
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception("Location services disabled");
    }

    /// check permission
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        throw Exception("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception("Location permanently denied");
    }

    /// try last known position first
    Position? position = await Geolocator.getLastKnownPosition();

    position ??= await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
      timeLimit: const Duration(seconds: 10),
    );

    final lat = position.latitude;
    final lon = position.longitude;

    /// get placemark
    List<Placemark> placemarks = await placemarkFromCoordinates(
      lat,
      lon,
      localeIdentifier: locale,
    );

    final place = placemarks.first;

    final district = place.locality;
    final city = place.subAdministrativeArea;
    final governorate = place.administrativeArea;

    String cityName;

    if (district != null && city != null) {
      cityName = "$district $city";
    } else {
      cityName = district ?? city ?? governorate ?? "Unknown";
    }

    final address = cityName;

    return LocationModels(lat: lat, lon: lon, city: cityName, address: address);
  }
}
