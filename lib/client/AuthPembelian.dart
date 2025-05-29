import 'dart:io';

import 'dart:convert';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:reusemart_mobile/entity/DetailPembelian.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPembelian {
  static final String url = 'http://10.0.2.2:8000/api';
  static final String endpoint = '';

  static Future<List<DetailPembelian>> getPembelian() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token tidak ditemukan');
    }

    final response = await get(
      Uri.parse('$url/order-history'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Gagal memuat data pembelian');
    }

    var data = jsonDecode(response.body);
    print("data: ${data['data']}");
    print("Jumlah data pembelian: ${data['data'].length}");
    await prefs.setString('pembelian_data', jsonEncode(data['data']));
    final List<dynamic> jsonList = json.decode(response.body)['data'];
    return jsonList.map((json) => DetailPembelian.fromJson(json)).toList();
  }
}
