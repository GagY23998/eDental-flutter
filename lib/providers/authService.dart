import 'package:edental/models/userLogin.dart';
import 'package:http/http.dart' as http;
import '../../models/user.dart';
import 'baseProvider.dart';

class AuthService extends BaseProvider<UserLogin> {
  AuthService({apiName = 'auth'}) : super(apiName);

  Future<UserLogin> Login(UserLogin userLogin) async =>
      create(userLogin, path: '/login');
}

class UserService extends BaseProvider<User> {
  UserService({apiName = 'user'}) : super(apiName);
}
