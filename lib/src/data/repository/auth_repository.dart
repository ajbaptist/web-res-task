import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:task/src/data/model/user_model.dart';
import 'package:task/src/utils/api_routes.dart';

class AuthRepository {
  static var client = http.Client();

  static Future<bool> loginService(
      {required String mail, required String password}) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var data = jsonEncode({"email": mail, "password": password});
      var res = await client.post(Uri.parse(ApiRoutes.login),
          body: data, headers: headers);
      print('data----->${res.body}');
      Fluttertoast.showToast(msg: res.body);
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('error----->$e');
      Fluttertoast.showToast(msg: e.toString());
      return false;
    }
  }

  static Future<bool> registerService(
      {required String mail, required String password}) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var data = jsonEncode({"email": mail, "password": password});
      var res = await client.post(Uri.parse(ApiRoutes.register),
          body: data, headers: headers);
      print('data----->${res.body}');
      Fluttertoast.showToast(msg: res.body);
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      print('error----->$e');
      return false;
    }
  }
}
