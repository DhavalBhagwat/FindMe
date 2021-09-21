class Location {

  double? latitude = 0.0;
  double? longitude = 0.0;
  String? city = "--";
  String? timeZone = "--";
  String? ip = "--";
  String? isp = "--";

  Location({
    this.latitude,
    this.longitude,
    this.city,
    this.timeZone,
    this.ip,
    this.isp
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