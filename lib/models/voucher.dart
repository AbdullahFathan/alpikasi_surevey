class Voucher {
  Voucher({
    this.idVoucher,
    this.namaVoucher,
    this.sk,
    this.total,
    this.poinVoucher,
  });

  String? idVoucher;
  String? namaVoucher;
  String? sk;
  int? total;
  int? poinVoucher;

  factory Voucher.fromJson(Map<String, dynamic> json) => Voucher(
        idVoucher: json["id_voucher"],
        namaVoucher: json["nama_voucher"],
        sk: json["sk"],
        total: json["total"],
        poinVoucher: json["poin_voucher"],
      );

  Map<String, dynamic> toJson() => {
        "id_voucher": idVoucher,
        "nama_voucher": namaVoucher,
        "sk": sk,
        "total": total,
        "poin_voucher": poinVoucher,
      };
}
