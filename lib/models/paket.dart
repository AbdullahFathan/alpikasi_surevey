class Paket {
  Paket({
    this.idPaket,
    this.namaPaket,
    this.hargaPaket,
    this.poinPaket,
    this.maxRespon,
  });

  int? idPaket;
  String? namaPaket;
  int? hargaPaket;
  int? poinPaket;
  int? maxRespon;

  factory Paket.fromJson(Map<String, dynamic> json) => Paket(
        idPaket: json["id_paket"],
        namaPaket: json["nama_paket"],
        hargaPaket: json["harga_paket"],
        poinPaket: json["poin_paket"],
        maxRespon: json["max_respon"],
      );

  Map<String, dynamic> toJson() => {
        "id_paket": idPaket,
        "nama_paket": namaPaket,
        "harga_paket": hargaPaket,
        "poin_paket": poinPaket,
        "max_respon": maxRespon,
      };
}
