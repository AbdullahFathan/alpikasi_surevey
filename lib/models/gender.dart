class Gender {
  Gender({
    this.idGender,
    this.gender,
  });

  int? idGender;
  String? gender;

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
        idGender: json["id_gender"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "id_gender": idGender,
        "gender": gender,
      };
}
