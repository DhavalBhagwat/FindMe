import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:findme/podos/Location.dart';

class NetworkService {

  static NetworkService? _instance;
  NetworkService._();
  factory NetworkService() => getInstance;

  static NetworkService get getInstance {
    if (_instance == null) {
      _instance = new NetworkService._();
    }
    return _instance!;
  }

  Future<Location?> getIPLocation({String ipAddress = ""}) async {
    try {
      if (ipAddress == "") {
        await http.get(Uri.parse('https://api.ipify.org')).then((response) async {
          if (response.statusCode == 200) {
            ipAddress = response.body;
          }
        });
      }
      return await http.get(Uri.parse('https://geo.ipify.org/api/v1?apiKey=at_5fJFnup2XWIiKcr37u7JN3jYpTbhY&ipAddress=$ipAddress')).then((response) async {
        print(response.body);
        if (response.statusCode == 200) {
          var json = jsonDecode(response.body);
          if (json["location"]['lat'] != 0) return Location(
              latitude: json["location"]['lat'],
              longitude: json["location"]['lng'],
              city: json["location"]['city'],
              timeZone: json["location"]['timezone'].toString(),
              ip: json["ip"],
              isp: json["isp"]
          );
          else {
            print("here");
            return Location();
          }
        } else return Location();

      });
    } catch (error) {
      debugPrint(error.toString());
      return Location();
    }
  }

}
