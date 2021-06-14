import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.namaLengkap,
    this.email,
    this.nopol,
    this.jenisKendaraan,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String namaLengkap;
  String email;
  String nopol;
  String jenisKendaraan;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        namaLengkap: json["nama_lengkap"],
        email: json["email"],
        nopol: json["nopol"],
        jenisKendaraan: json["jenis_kendaraan"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_lengkap": namaLengkap,
        "email": email,
        "nopol": nopol,
        "jenis_kendaraan": jenisKendaraan,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
