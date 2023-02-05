import 'package:edental/models/userLogin.dart';
import 'package:edental/providers/authService.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class Auth extends ChangeNotifier {
  AuthService authService = AuthService();
  User? user;
  bool get isAuthenticated => user != null;

  Future<void> authenticate(String userName, String password) async {
    UserLogin userLogin = UserLogin(userName, password);
    User? loggedUser = await authService.Login(userLogin);
    user = loggedUser;
    notifyListeners();
  }

  Future<void> signUp(String firstName, String lastName, String userName,
      String emailAddress, String password, String confirmPassword) async {
    if (password != confirmPassword) {
      return;
    }
    User newUser = User();
    newUser.firstName = firstName;
    newUser.lastName = lastName;
    newUser.username = userName;
    newUser.password = password;
    newUser.passwordConfirm = confirmPassword;
    newUser.email = emailAddress;
    User? confirmedUser = await authService.Register(newUser);
    if (confirmedUser != null) {
      await authenticate(confirmedUser.username, confirmedUser.password ?? '');
    }
    notifyListeners();
  }

  Future<void> logout() async {
    user = null;
    notifyListeners();
  }
}
