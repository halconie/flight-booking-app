import 'package:flutter/foundation.dart';

class UserRole extends ChangeNotifier {
  String _role = 'guest';

  String get role => _role;

  set role(String role) {
    _role = role;
    notifyListeners();
  }
}