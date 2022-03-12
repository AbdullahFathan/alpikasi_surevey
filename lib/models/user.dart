class User {
  User({
    this.idUser,
    this.email,
    this.password,
    this.username,
    this.ttl,
    this.idGender,
    this.idPekerjaan,
    this.idStatus,
    this.idDomisili,
    this.poinUser,
    this.createTimeUser,
    this.updateTimeUser,
    this.gender,
    this.namaPekerjaan,
    this.ktgStatus,
    this.idProvinsi,
    this.idKota,
    this.namaProvinsi,
    this.namaKota,
  });

  int? idUser;
  String? email;
  String? password;
  String? username;
  DateTime? ttl;
  int? idGender;
  int? idPekerjaan;
  int? idStatus;
  int? idDomisili;
  int? poinUser;
  DateTime? createTimeUser;
  DateTime? updateTimeUser;
  String? gender;
  String? namaPekerjaan;
  String? ktgStatus;
  int? idProvinsi;
  int? idKota;
  String? namaProvinsi;
  String? namaKota;

  factory User.fromJson(Map<String, dynamic> json) => User(
        idUser: json["id_user"],
        email: json["email"],
        password: json["password"],
        username: json["username"],
        ttl: DateTime.parse(json["ttl"]),
        idGender: json["id_gender"],
        idPekerjaan: json["id_pekerjaan"],
        idStatus: json["id_status"],
        idDomisili: json["id_domisili"],
        poinUser: json["poin_user"],
        createTimeUser: DateTime.parse(json["create_time_user"]),
        updateTimeUser: DateTime.parse(json["update_time_user"]),
        gender: json["gender"],
        namaPekerjaan: json["nama_pekerjaan"],
        ktgStatus: json["ktg_status"],
        idProvinsi: json["id_provinsi"],
        idKota: json["id_kota"],
        namaProvinsi: json["nama_provinsi"],
        namaKota: json["nama_kota"],
      );

  Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "email": email,
        "password": password,
        "username": username,
        "ttl": ttl!.toIso8601String(),
        "id_gender": idGender,
        "id_pekerjaan": idPekerjaan,
        "id_status": idStatus,
        "id_domisili": idDomisili,
        "poin_user": poinUser,
        "create_time_user": createTimeUser!.toIso8601String(),
        "update_time_user": updateTimeUser!.toIso8601String(),
        "gender": gender,
        "nama_pekerjaan": namaPekerjaan,
        "ktg_status": ktgStatus,
        "id_provinsi": idProvinsi,
        "id_kota": idKota,
        "nama_provinsi": namaProvinsi,
        "nama_kota": namaKota,
      };
}
