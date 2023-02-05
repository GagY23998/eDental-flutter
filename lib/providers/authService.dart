import 'dart:async';

import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:edental/models/userLogin.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../../models/user.dart';
import 'baseProvider.dart';

class AuthService extends BaseProvider<UserLogin> {
  AuthService({apiName = 'auth'}) : super(apiName);

  Future<User?> Login(UserLogin userLogin) async {
    String? apiUrl = dotenv.env['API_URL'];
    Response res = await http.post(Uri.parse('$apiUrl/auth/login'),
        headers: BaseProvider.headers, body: JsonMapper.serialize(userLogin));
    return JsonMapper.deserialize<User>(res.body);
  }

  Future<User?> Register(User userLogin) async {
    String? apiUrl = dotenv.env['API_URL'];
    Response res = await http.post(Uri.parse('$apiUrl/auth/register'),
        headers: BaseProvider.headers, body: JsonMapper.serialize(userLogin));
    return JsonMapper.deserialize<User>(res.body);
  }
}

class UserService extends BaseProvider<User> {
  UserService({apiName = 'user'}) : super(apiName);
}
