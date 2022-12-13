import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/device.dart';

class RemoteService {
  var client = http.Client();

  Map<String, String> header = {
    'Authorization':
        'Basic ZjIwMTkwMDAzQGR1YmFpLmJpdHMtcGlsYW5pLmFjLmluOkRoYWtzaGluYTkk'
  };

  var uri = Uri.parse(
      'https://env588915.eu-latest.cumulocity.com/inventory/managedObjects/19209');

  Future<Device> fetchDevice() async {
    var response = await client.get(uri, headers: header);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return (Device.fromJson(json));
    } else {
      throw Exception("Failed to load Device");
    }
  }

  Future<void> sendData({required String jsonProperty,required dynamic data}) async {
    var headers = {
      'Authorization':
          'Basic ZjIwMTkwMDAzQGR1YmFpLmJpdHMtcGlsYW5pLmFjLmluOkRoYWtzaGluYTkk',
      'Content-Type': 'application/json'
    };

    var request = http.Request(
      'PUT',
      Uri.parse(
          'https://env588915.eu-latest.cumulocity.com/inventory/managedObjects/19209'),
    );
    request.body = json.encode({jsonProperty: data});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      debugPrint(await response.stream.bytesToString());
    } else {
      debugPrint(response.reasonPhrase);
    }
  }
}
