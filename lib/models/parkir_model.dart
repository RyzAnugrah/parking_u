import 'dart:convert';

ParkirModel parkirModelFromJson(String str) =>
    ParkirModel.fromJson(json.decode(str));

String parkirModelToJson(ParkirModel data) => json.encode(data.toJson());

class ParkirModel {
  ParkirModel({
    this.id,
    this.namaParkir,
    this.lokasiParkir,
    this.jarak,
    this.jam,
    this.harga,
    this.rating,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String namaParkir;
  String lokasiParkir;
  int jarak;
  String jam;
  int harga;
  int rating;
  DateTime createdAt;
  DateTime updatedAt;

  factory ParkirModel.fromJson(Map<String, dynamic> json) => ParkirModel(
        id: json["id"],
        namaParkir: json["nama_parkir"],
        lokasiParkir: json["lokasi_parkir"],
        jarak: json["jarak"],
        jam: json["jam"],
        harga: json["harga"],
        rating: json["rating"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_parkir": namaParkir,
        "lokasi_parkir": lokasiParkir,
        "jarak": jarak,
        "jam": jam,
        "harga": harga,
        "rating": rating,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
