import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String _baseUrl = 'https://ehara.iopri.co.id';

  static Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('$_baseUrl/api/auth/sign-in');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Accept': 'application/json',
        },
        body: {
          'email': email,
          'password': password,
        },
      );

      final responseData = jsonDecode(response.body);
      final setCookie = response.headers['set-cookie'];

      if (response.statusCode == 200 && responseData['meta']['code'] == 200) {
        final accessToken = responseData['data']['access_token'];
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('access_token', accessToken);

        if (setCookie != null) {
          final sessionMatch = RegExp(r'laravel_session=([^;]+)').firstMatch(setCookie);
          if (sessionMatch != null) {
            final laravelSession = sessionMatch.group(1);
            await prefs.setString('laravel_session', laravelSession!);
            debugPrint('laravel_session: $laravelSession');
          }
        }
        debugPrint(prefs.getString('access_token'));
        return {
          'success': true,
          'data': responseData['data'],
        };
      } else {
        return {
          'success': false,
          'message': responseData['meta']['message'] ?? 'Login failed',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'An error occurred. Please try again.',
      };
    }
  }
}
