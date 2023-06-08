import 'dart:convert';

import 'package:flutter_auth_bloc/constant.dart';
import 'package:flutter_auth_bloc/data/model/login.dart';
import 'package:flutter_auth_bloc/data/model/register.dart';
import 'package:http/http.dart' as http;

class AppRepository {
  Future<Login> login(Map data) async {
    final response = await http.post(Uri.parse('$BASE_URL/login'), body: data);
    if (response.statusCode == 200) {
      return Login.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 401 || response.statusCode == 400) {
      final errorResponse = jsonDecode(response.body);
      final errorMessage = errorResponse['message'] as String?;
      throw Exception(errorMessage);
    } else {
      throw Exception('Something went wrong!: ${response.reasonPhrase}');
    }
  }

  Future<Register> register(Map data) async {
    final response =
        await http.post(Uri.parse('$BASE_URL/register'), body: data);
    if (response.statusCode == 201) {
      return Register.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 401 || response.statusCode == 400) {
      final errorResponse = jsonDecode(response.body);
      final errorMessage = errorResponse['message'] as String?;
      throw Exception(errorMessage);
    } else {
      throw Exception('Something went wrong!: ${response.reasonPhrase}');
    }
  }
}
