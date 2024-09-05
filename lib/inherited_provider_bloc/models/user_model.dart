import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  String _name = 'Guest';

  String get name => _name;

  void updateName(String newName) {
    _name = newName;
    notifyListeners();
  }
}
