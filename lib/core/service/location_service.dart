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

    /// get position
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
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

    /// district (قسم)
    final district = place.locality;

    /// city (مدينة)
    final city = place.subAdministrativeArea;

    /// governorate
    final governorate = place.administrativeArea;

    /// build city name
    String cityName;

    if (district != null && city != null) {
      cityName = "$district $city";
    } else {
      cityName = district ?? city ?? governorate ?? "Unknown";
    }

    /// full address (like Muslim apps)
    final address = cityName;

    return LocationModels(lat: lat, lon: lon, city: cityName, address: address);
  }
}
