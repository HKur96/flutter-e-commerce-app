import 'package:flutter/material.dart';

class ValidationProvider with ChangeNotifier {
  String? _passwordError;
  bool _submitted = false;

  String? get passwordError => _submitted ? _passwordError : null;

  void validatePassword(String password) {
    if (password.isEmpty) {
      _passwordError = 'Please enter your password';
    } else if (password.length < 8) {
      _passwordError = 'Password must be at least 8 characters';
    } else if (!RegExp(
            r'''^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#\$%^&*()_+\-=\[\]{};:'"\\|,.<>\/?]).+$''')
        .hasMatch(password)) {
      _passwordError = 'Please enter a valid password';
    } else {
      _passwordError = null;
    }
    notifyListeners();
  }

  void submit() {
    _submitted = true;
    notifyListeners();
  }

  void clearValidation() {
    _submitted = false;
    notifyListeners();
  }

  bool get isValid => _passwordError == null;
}
