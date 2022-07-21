import 'package:flutter/material.dart';
import 'package:test_chart_project/middleware/models/user.dart';

class UsersNotifier extends ChangeNotifier {
  List<User> _users = [];
  List<User> get users => _users;

  void addUsers({required List<User> users}) {
    _users = users;

    notifyListeners();
  }
}
