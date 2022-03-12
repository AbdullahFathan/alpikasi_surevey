import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:kuisoner_app/common/cahce.dart';
import 'package:kuisoner_app/common/constant.dart';
import 'package:kuisoner_app/models/user.dart';

class AuthServices {
  Future<User?> checkAuth() async {
    final data = await Cache.getData('user_data');
    if (data != null) {
      return User(
          email: data['email'], token: data['token'], idUser: data['id_user']);
    }
    return null;
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$BASE_URL/user/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8'
      },
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data['success'] == true) {
        print(data[0]);
        await Cache.writeData(
          key: 'user_data',
          value: {
            'email': email,
            'id_user': data['data'][0]['id_user'],
            'token': data['data'][0]['token'],
          },
        );
        return true;
      }
      return false;
    } else {
      throw Exception("Failed get data login");
    }
  }

  Future<bool> register({
    required String email,
    required String password,
    required String username,
    required String ttl,
    required int id_gender,
    required int id_pekerjaan,
    required int id_status,
    required int id_provinsi,
    required int id_kota,
  }) async {
    final response = await http.post(
      Uri.parse('$BASE_URL/user/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, dynamic>{
        "email": email,
        "password": password,
        "username": username,
        "ttl": ttl,
        "id_gender": id_gender,
        "id_pekerjaan": id_pekerjaan,
        "id_status": id_status,
        "id_provinsi": id_provinsi,
        "id_kota": id_kota,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success'] == true) {
        return true;
      }
      return false;
    } else {
      throw Exception("Failed at register user");
    }
  }
}
