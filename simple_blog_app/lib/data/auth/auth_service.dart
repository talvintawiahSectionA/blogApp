import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthServiceAPI {
  static Future<Map<String, dynamic>?> registerUser({
    required String username,
    required String email,
    required String password,
  }) async {
    final data = {
      "username": username.trim(),
      "email": email.trim(),
      "password": password.trim(),
    };
    final headers = {
      'Content-Type': 'application/json',
    };

    final url = "${dotenv.env['API_URL']}/users/register/";

    try {
      final response = await Dio().post(
        url,
        data: data,
        options: Options(headers: headers),
      );

      if (response.statusCode == 201) {
        print("Registration Successful: ${response.data}");
        return response.data;
      } else {
        print("Unexpected Status Code: ${response.statusCode}");
        return null;
      }
    } on DioException catch (e) {
      print("DioException: ${e.response?.data}");
      throw Exception(e.response?.data["error"] ?? "Registration failed");
    } catch (e) {
      print("Unexpected Error: $e");
      throw Exception("Something went wrong.");
    }
  }

  static Future<Map<String, dynamic>?> loginUser({
    required String email,
    required String password,
  }) async {
    final data = {
      "email": email.trim(),
      "password": password.trim(),
    };
    final headers = {
      'Content-Type': 'application/json',
    };

    final url = "${dotenv.env['API_URL']}/users/login/";

    try {
      final response = await Dio().post(
        url,
        data: data,
        options: Options(headers: headers),
      );

      if (response.statusCode == 201) {
        print("Login Successful: ${response.data}");
        return response.data;
      } else {
        print("Unexpected Status Code: ${response.statusCode}");
        return null;
      }
    } on DioException catch (e) {
      print("DioException: ${e.response?.data}");
      throw Exception(e.response?.data["error"] ?? "Registration failed");
    } catch (e) {
      print("Unexpected Error: $e");
      throw Exception("Something went wrong.");
    }
  }
}
