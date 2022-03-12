class Provinsi {
  Provinsi({
    this.idProvinsi,
    this.namaProvinsi,
  });

  int? idProvinsi;
  String? namaProvinsi;

  factory Provinsi.fromJson(Map<String, dynamic> json) => Provinsi(
        idProvinsi: json["id_provinsi"],
        namaProvinsi: json["nama_provinsi"],
      );

  Map<String, dynamic> toJson() => {
        "id_provinsi": idProvinsi,
        "nama_provinsi": namaProvinsi,
      };
}
