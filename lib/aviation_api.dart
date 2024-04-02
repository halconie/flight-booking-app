// lib/aviation_api.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class AviationApi {
  final String _baseUrl = 'http://api.aviationstack.com/v1';
  final String _accessKey = '479fd1f606803cde5f764f7290cc260e'; // Replace with your actual access key

  Future<Map<String, dynamic>> getFlightData() async {
    var response = await http.get(Uri.parse('$_baseUrl/flights?access_key=$_accessKey'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load flight data');
    }
  }
}