import 'dart:convert';
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'baseServiceMixin.dart';
import 'dart:convert';

class BaseProvider<T, Srequest> extends ChangeNotifier
    with BaseServiceMixin<T> {
  static final String? _url = dotenv.env["API_URL"];
  final String _apiName;
  String _username = "";
  String _password = "";
  Map<String, String> headers = <String, String>{
    'content-type': 'application/json',
  };
  BaseProvider(this._apiName, this._username, this._password) {
    if (this._username.isNotEmpty && this._password.isNotEmpty) {
      String authorizationTemplate = '$_username:$_password';
      Codec<String, String> stringBase64 = utf8.fuse(base64);
      headers = <String, String>{
        'content-type': 'application/json',
        'Authorization': ' Basic ${stringBase64.encode(authorizationTemplate)}'
      };
    }
  }
  Uri uri = Uri.base;
  @override
  Future<T> create(request, {path = ''}) async {
    uri = Uri.parse('$_url/$_apiName$path');
    final result = await http.post(uri,
        headers: headers, body: JsonMapper.serialize(request));
    notifyListeners();
    return result as T;
  }

  @override
  Future<bool?> delete(objectId) async {
    uri = Uri.parse('$_url');
    final result = await http
        .delete(uri, headers: headers)
        .then((value) => JsonMapper.deserialize<bool>(value.body));
    notifyListeners();
    return result;
  }

  @override
  Future<List<T>> get(searchRequest, {path}) async {
    uri = Uri.parse('$_url/$_apiName$path');
    final result = await http
        .post(uri, headers: headers, body: searchRequest)
        .then((value) => value.body as List<T>);
    notifyListeners();
    return result;
  }

  @override
  Future<List<T>> getAll() async {
    uri = Uri.parse('$_url/$_apiName');
    final result = await http.get(uri, headers: headers);
    final deserializedResult = JsonMapper.deserialize<List<T>>(result.body);
    notifyListeners();
    return deserializedResult ?? [];
  }

  @override
  Future<T> getById(id) async {
    uri = Uri.parse('$_url/$_apiName/$id');
    final result = await http
        .post(uri, headers: headers)
        .then((value) => JsonMapper.deserialize(value.body) as T);
    notifyListeners();
    return result;
  }

  Future<List<T>> find(Srequest request, {path = ''}) async {
    uri = Uri.parse('$_url/$_apiName$path');
    final result = await http.post(uri,
        headers: headers, body: JsonMapper.serialize(request));
    final deserializedResult = JsonMapper.deserialize<List<T>>(result.body);
    return deserializedResult ?? [];
  }
}
