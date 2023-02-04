import 'package:edental/models/userLogin.dart';
import 'package:edental/providers/authService.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class Auth extends ChangeNotifier {
  AuthService authService = AuthService();
  User? user;
  bool get isAuthenticated => user != null;

  Future<UserLogin> authenticate(String userName, String password) async {
    UserLogin userLogin = UserLogin(userName, password);
    return authService.Login(userLogin);
  }

  Future<void> signUp(
      String userName, String password, String confirmPassword) async {
    if (password != confirmPassword) {
      // show message
    }
    notifyListeners();
  }

  Future<void> logout() async {
    user = null;
    notifyListeners();
  }
}
