import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:reusemart_mobile/client/SecureStorage.dart';

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:8000';

  Future<String> getUserRole(String authToken) async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/cek-role'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $authToken',
      },
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['role'];
    } else {
      throw Exception('Failed to get user role');
    }
  }

  Future<void> updateFcmToken(int id, String fcmToken) async {
    String? authToken = await getToken();
    if (authToken == null) throw Exception('No auth token found');

    final userType = await getUserRole(authToken);

    final response = await http.post(
      Uri.parse('$baseUrl/api/update-fcm-token'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $authToken',
      },
      body: jsonEncode({
        'id': id,
        'fcm_token': fcmToken,
        'user_type': userType,
      }),
    );
    if (response.statusCode != 200) {
      print(
          "Failed to update FCM token: ${response.statusCode}, ${response.body}");
      throw Exception('Failed to update FCM token');
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("Failed to login: ${response.statusCode}, ${response.body}");
      throw Exception('Failed to login');
    }
  }

  Future<String?> getToken() async {
    return await SecureStorage.getToken();
  }

  Future<void> saveToken(String token) async {
    await SecureStorage.saveToken(token);
  }
}
