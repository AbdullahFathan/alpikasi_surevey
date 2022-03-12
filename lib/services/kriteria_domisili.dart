import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kuisoner_app/common/cahce.dart';
import 'package:kuisoner_app/common/constant.dart';
import 'package:kuisoner_app/models/gender.dart';
import 'package:kuisoner_app/models/kota.dart';
import 'package:kuisoner_app/models/paket.dart';
import 'package:kuisoner_app/models/pekerjaan.dart';
import 'package:kuisoner_app/models/provinsi.dart';
import 'package:kuisoner_app/models/status.dart';

class KriteriaDomisili {
  Future<String> getToken() async {
    final cache = await Cache.getData("user_data");
    return cache["token"];
  }

  Future<int> getIdUser() async {
    final cache = await Cache.getData("user_data");
    return cache["id_user"];
  }

  Future<List<Pekerjaan>> getPekerjaan() async {
    final response = await http.get(Uri.parse("$BASE_URL/kriteria/pekerjaan"));
    List<Pekerjaan> pekerjaan = [];

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data["success"] == true) {
        pekerjaan = (data["data"] as List<dynamic>)
            .map((val) => Pekerjaan.fromJson(val))
            .toList();
      } else {
        throw Exception("getPekerjaan Fail");
      }
    }
    return pekerjaan;
  }

  Future<List<Status>> getStatus() async {
    final response = await http.get(Uri.parse("$BASE_URL/kriteria/gender"));
    List<Status> status = [];

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data["success"] == true) {
        status = (data["data"] as List<dynamic>)
            .map((val) => Status.fromJson(val))
            .toList();
      }
    } else {
      throw Exception("getStatus fail");
    }
    return status;
  }

  Future<List<Gender>> getGender() async {
    final response = await http.get(Uri.parse("$BASE_URL/kriteria/gender"));
    List<Gender> gender = [];

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data["success"] == true) {
        gender = (data["data"] as List<dynamic>)
            .map((val) => Gender.fromJson(val))
            .toList();
      }
    } else {
      throw Exception("getStatus fail");
    }
    return gender;
  }

  Future<List<Provinsi>> getProvinsi() async {
    final token = await getToken();
    final response = await http.get(
      Uri.parse("$BASE_URL/domisili/provinsi"),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token',
      },
    );
    List<Provinsi> provinsi = [];
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data["success"] == true) {
        provinsi = (data["data"] as List<dynamic>)
            .map((val) => Provinsi.fromJson(val))
            .toList();
      }
    } else {
      throw Exception("getStatus fail");
    }
    return provinsi;
  }

  Future<List<Kota>> getKotaByIdProvinsi(int id) async {
    final response = await http.get(Uri.parse("$BASE_URL/domisili/kota/$id"));

    List<Kota> kota = [];

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data["success"] == true) {
        kota = (data["data"] as List<dynamic>)
            .map((val) => Kota.fromJson(val))
            .toList();
      }
    } else {
      throw Exception("getStatus fail");
    }
    return kota;
  }

  Future<List<Paket>> getPaket() async {
    final response = await http.get(Uri.parse("$BASE_URL/kuesioner/paket"));
    List<Paket> paket = [];

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data["success"] == true) {
        paket = (data["data"] as List<dynamic>)
            .map((val) => Paket.fromJson(val))
            .toList();
      }
    }
    return paket;
  }
}
