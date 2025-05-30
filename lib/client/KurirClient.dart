import 'dart:io';

import 'dart:convert';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:reusemart_mobile/entity/Pegawai.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KurirClient {
  static final String url = 'http://10.0.2.2:8000/api';

  static Future<Pegawai> fetchCurrentKurir() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      if (token == null || token.isEmpty) {
        throw Exception('No authentication token found.');
      }
      final response = await get(
        Uri.parse('$url/fetchPegawaiByLogin'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      print(response.body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        await prefs.setString('current_kurir', jsonEncode(data['pegawai']));
        return Pegawai.fromJson(data['pegawai']);
      } else {
        throw Exception('Failed to fetch kurir: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Error fetching kurir: $e');
    }
  }


}