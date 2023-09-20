import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../utils/http_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  String? _name;
  final Dio http;

  AuthProvider(this.http);

  bool get isAuth {
    print(token != null);
    return token != null;
  }

  String? get name {
    return _name;
  }

  String? get token {
    if (_token != null && _token!.isNotEmpty) return _token;
    return null;
  }

  Future<void> _authenticate(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
    _token = token;
    notifyListeners();
  }

  Future<void> login(String username, String password) async {
    // if (kDebugMode) {
    //   print("Logging in");
    // }
    // if (kDebugMode) {
    //   print(username);
    // }
    // if (kDebugMode) {
    //   print(password);
    // }
    try {
      final response = await http.post("/user/login", data: {
        "username": username,
        "password": password,
      });
      _authenticate(response.data["access_token"]);
      _name = response.data["user"]["name"];
      // _authenticate("This is a really super secret token");
      // if (kDebugMode) {
      //   print(response.data["access_token"]);
      //   print(_name);
      // }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.response!.data);
      }
      throw HttpException(e.response!.data["message"]);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw HttpException("Something went wrong");
    }
  }

  Future<void> logout() async {
    // _token = null;
    notifyListeners(); 
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    prefs.clear();
    notifyListeners(); 

  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey("token")) return false;
    final extractedToken = prefs.getString("token");

    _token = extractedToken;
    notifyListeners();
    return true;
  }
}
