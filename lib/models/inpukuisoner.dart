class InputKuisoner {
  InputKuisoner({
    this.nama,
    this.link,
    this.usiaAwal,
    this.usiaAkhir,
    this.idGender,
    this.idPekerjaan,
    this.idStatus,
    this.idKota,
    this.idProvinsi,
    this.syarat,
    this.idPaket,
    this.idPaymentMethod,
  });

  String? nama;
  String? link;
  int? usiaAwal;
  int? usiaAkhir;
  int? idGender;
  int? idPekerjaan;
  int? idStatus;
  int? idKota;
  int? idProvinsi;
  String? syarat;
  int? idPaket;
  int? idPaymentMethod;

  factory InputKuisoner.fromJson(Map<String, dynamic> json) => InputKuisoner(
        nama: json["nama"],
        link: json["link"],
        usiaAwal: json["usia_awal"],
        usiaAkhir: json["usia_akhir"],
        idGender: json["id_gender"],
        idPekerjaan: json["id_pekerjaan"],
        idStatus: json["id_status"],
        idKota: json["id_kota"],
        idProvinsi: json["id_provinsi"],
        syarat: json["syarat"],
        idPaket: json["id_paket"],
        idPaymentMethod: json["id_paymentMethod"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "link": link,
        "usia_awal": usiaAwal,
        "usia_akhir": usiaAkhir,
        "id_gender": idGender,
        "id_pekerjaan": idPekerjaan,
        "id_status": idStatus,
        "id_kota": idKota,
        "id_provinsi": idProvinsi,
        "syarat": syarat,
        "id_paket": idPaket,
        "id_paymentMethod": idPaymentMethod,
      };
}
