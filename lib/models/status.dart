class Status {
  Status({
    this.idStatus,
    this.ktgStatus,
  });

  int? idStatus;
  String? ktgStatus;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        idStatus: json["id_status"],
        ktgStatus: json["ktg_status"],
      );

  Map<String, dynamic> toJson() => {
        "id_status": idStatus,
        "ktg_status": ktgStatus,
      };
}
