class PreEclampsiaUsrPosition {
  const PreEclampsiaUsrPosition({
    required this.longitude,
    required this.latitude,
    this.accuracy,
    required this.altitude,
    required this.heading,
    required this.speed,
    required this.speedAccuracy,
    required this.userid,
    this.city,
    this.country,
    this.state,
    this.countrycode,
    this.floor,
    this.isMocked = false,
  });

  final double latitude;
  final double longitude;
  final String altitude;
  final double? accuracy;
  final String heading;
  final int? floor;
  final String speed;
  final double speedAccuracy;
  final bool isMocked;
  final String? userid;
  final String? city;
  final String? country;
  final String? state;
  final String? countrycode;

  @override
  bool operator ==(Object other) {
    var areEqual = other is PreEclampsiaUsrPosition &&
        other.accuracy == accuracy &&
        other.altitude == altitude &&
        other.heading == heading &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.floor == floor &&
        other.speed == speed &&
        other.speedAccuracy == speedAccuracy &&
        other.isMocked == isMocked;

    return areEqual;
  }

  @override
  int get hashCode =>
      accuracy.hashCode ^
      altitude.hashCode ^
      heading.hashCode ^
      latitude.hashCode ^
      longitude.hashCode ^
      floor.hashCode ^
      speed.hashCode ^
      speedAccuracy.hashCode ^
      isMocked.hashCode;

  @override
  String toString() {
    return 'Latitude: $latitude, Longitude: $longitude';
  }

  static PreEclampsiaUsrPosition fromMap(Map<String, dynamic> positionMap) {
    //static TroveUsrPosition fromMap(dynamic message) {
    //final Map<dynamic, dynamic> positionMap = message;

    return PreEclampsiaUsrPosition(
      latitude: positionMap['latitude'] ?? 0.0,
      longitude: positionMap['longitude'] ?? 0.0,
      // timestamp: timestamp,
      userid: positionMap['userid'],
      altitude: positionMap['altitude'].toString(),
      heading: positionMap['heading'].toString(),
      floor: positionMap['floor'],
      speed: positionMap['speed'].toString(),
      speedAccuracy: positionMap['speed_accuracy'] ?? 0.0,
      isMocked: positionMap['is_mocked'] ?? false,
      city: positionMap['city'].toString(),
      country: positionMap['country'].toString(),
      state: positionMap['state'].toString(),
      countrycode: positionMap['countrycode'].toString(),
    );
  }

  /// Converts the [Position] instance into a [Map] instance that can be
  /// serialized to JSON.
  Map<String, dynamic> toJson() => {
        'longitude': longitude,
        'latitude': latitude,
        'accuracy': accuracy,
        'altitude': altitude,
        'floor': floor,
        'heading': heading,
        'speed': speed,
        'speed_accuracy': speedAccuracy,
        'is_mocked': isMocked,
        'userid': userid,
        'city': city,
        'country': country,
        'state': state,
        'countrycode': countrycode,
      };
}
