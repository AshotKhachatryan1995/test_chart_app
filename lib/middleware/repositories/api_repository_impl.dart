import 'dart:convert';

import 'package:test_chart_project/middleware/models/api_error_model.dart';
import 'package:test_chart_project/middleware/models/user.dart';
import 'package:test_chart_project/middleware/repositories/api_repository.dart';
import 'package:http/http.dart' as http;

class ApiRepositoryImpl implements ApiRepository {
  @override
  Future<dynamic> loadUsers() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

      if (response.statusCode == 200) {
        final values = json.decode(response.body) as List;

        final users = values.map((e) => User.fromJson(e)).toList();

        return users;
      }

      return ApiErrorModel(
          statusCode: response.statusCode, errorMessage: 'Faild to get data');
    } catch (e) {
      return ApiErrorModel(statusCode: 400, errorMessage: 'Faild to get data');
    }
  }
}
