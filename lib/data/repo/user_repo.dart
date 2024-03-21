// ignore_for_file: unnecessary_null_comparison, depend_on_referenced_packages

import 'dart:async';

import 'package:dio/dio.dart';

import '../../network/constant.dart';
import '../../object_data/user_data.dart';
import '../service/user_service.dart';
import '../spref/spref.dart';

class UserRepo {
  final UserService _userService;
  UserRepo({required UserService userService}) : _userService = userService;

  Future<UserData> signIn(String phone, String pass) async {
    var c = Completer<UserData>();
    try {
      var response = await _userService.signIn(phone, pass);
      var userData = UserData.fromJson(response.data['Data']);

      if (userData != null) {
        SPref.instance.set(SPrefCache.KEY_TOKEN, userData.token);
        c.complete(userData);
      }
    } on DioException {
      c.completeError('Đăng nhập thất bại');
    } catch (e) {
      c.completeError(e);
    }

    return c.future;
  }

  Future<UserData> signUp(String displayName, String phone, String pass) async {
    var c = Completer<UserData>();
    try {
      var response = await _userService.signUp(displayName, phone, pass);
      var userData = UserData.fromJson(response.data['Data']);
      if (userData != null) {
        SPref.instance.set(SPrefCache.KEY_TOKEN, userData.token);
        c.complete(userData);
      }
    } on DioException {
      c.completeError('Đăng ký thất bại');
    } catch (e) {
      c.completeError(e);
    }

    return c.future;
  }
}
