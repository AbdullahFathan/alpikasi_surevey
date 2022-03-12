class Pekerjaan {
  Pekerjaan({
    this.idPekerjaan,
    this.namaPekerjaan,
  });

  int? idPekerjaan;
  String? namaPekerjaan;

  factory Pekerjaan.fromJson(Map<String, dynamic> json) => Pekerjaan(
        idPekerjaan: json["id_pekerjaan"],
        namaPekerjaan: json["nama_pekerjaan"],
      );

  Map<String, dynamic> toJson() => {
        "id_pekerjaan": idPekerjaan,
        "nama_pekerjaan": namaPekerjaan,
      };
}
