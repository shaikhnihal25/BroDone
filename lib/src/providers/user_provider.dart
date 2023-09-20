import 'package:flutter/material.dart';

class User {
  final String id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});
}

class UserProvider extends ChangeNotifier {
  User? _user;

  // Getter to access the current user
  User? get user => _user;

  // Method to set the user
  void setUser(User user) {
    _user = user;
    notifyListeners(); // Notify listeners when the user changes
  }

  // Method to sign out the user
  void signOut() {
    _user = null;
    notifyListeners();
  }
}
