import 'package:edental/models/userLogin.dart';
import 'package:edental/providers/authService.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class Auth extends ChangeNotifier {
  AuthService authService = AuthService();
  User? user;
  bool get isAuthenticated => user != null;
  Future<bool> authenticate(String userName, String password) async {
    UserLogin userLogin = UserLogin(userName, password);
    User? loggedUser = await authService.Login(userLogin);
    if (loggedUser != null) {
      user = loggedUser;
      user?.password = password;
      notifyListeners();
    }
    return loggedUser != null;
  }

  Future<bool> signUp(User newUser) async {
    User? confirmedUser = await authService.Register(newUser);
    notifyListeners();
    return confirmedUser != null;
  }

  Future<void> logout() async {
    user = null;
    notifyListeners();
  }
}
