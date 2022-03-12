class Kota {
  Kota({
    this.idKota,
    this.idProvinsi,
    this.namaKota,
  });

  int? idKota;
  int? idProvinsi;
  String? namaKota;

  factory Kota.fromJson(Map<String, dynamic> json) => Kota(
        idKota: json["id_kota"],
        idProvinsi: json["id_provinsi"],
        namaKota: json["nama_kota"],
      );

  Map<String, dynamic> toJson() => {
        "id_kota": idKota,
        "id_provinsi": idProvinsi,
        "nama_kota": namaKota,
      };
}
