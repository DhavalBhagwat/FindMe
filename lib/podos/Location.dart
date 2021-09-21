class Location {

  double? latitude;
  double? longitude;
  String? city;
  String? timeZone;
  String? ip;
  String? isp;

  Location({
    this.latitude = 51.5,
    this.longitude = -0.09,
    this.city = "--",
    this.timeZone = "--",
    this.ip = "--",
    this.isp = "--"
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: json["location"]['lat'],
      longitude: json["location"]['lng'],
      city: json["location"]['city'],
      timeZone: json["location"]['timezone'].toString(),
      ip: json["ip"],
      isp: json["isp"]
    );
  }

  Map<String, dynamic> toJson() => {
    'latitude': latitude,
    'longitude': longitude,
    'city': city,
    'timeZone': timeZone,
    'ip': ip,
    'isp': isp
  };

}