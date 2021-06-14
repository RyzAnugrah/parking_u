import 'dart:convert';

RiwayatModel riwayatModelFromJson(String str) => RiwayatModel.fromJson(json.decode(str));

String riwayatModelToJson(RiwayatModel data) => json.encode(data.toJson());

class RiwayatModel {
    RiwayatModel({
        this.id,
        this.lahanTerpilih,
        this.tarif,
        this.jenisPembayaran,
        this.statusPembayaran,
        this.waktuBooking,
        this.nomorKendaraan,
        this.kendaraan,
        this.namaPengguna,
        this.email,
        this.namaParkir,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String lahanTerpilih;
    String tarif;
    String jenisPembayaran;
    String statusPembayaran;
    String waktuBooking;
    String nomorKendaraan;
    String kendaraan;
    String namaPengguna;
    String email;
    String namaParkir;
    DateTime createdAt;
    DateTime updatedAt;

    factory RiwayatModel.fromJson(Map<String, dynamic> json) => RiwayatModel(
        id: json["id"],
        lahanTerpilih: json["lahan_terpilih"],
        tarif: json["tarif"],
        jenisPembayaran: json["jenis_pembayaran"],
        statusPembayaran: json["status_pembayaran"],
        waktuBooking: json["waktu_booking"],
        nomorKendaraan: json["nomor_kendaraan"],
        kendaraan: json["kendaraan"],
        namaPengguna: json["nama_pengguna"],
        email: json["email"],
        namaParkir: json["nama_parkir"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "lahan_terpilih": lahanTerpilih,
        "tarif": tarif,
        "jenis_pembayaran": jenisPembayaran,
        "status_pembayaran": statusPembayaran,
        "waktu_booking": waktuBooking,
        "nomor_kendaraan": nomorKendaraan,
        "kendaraan": kendaraan,
        "nama_pengguna": namaPengguna,
        "email": email,
        "nama_parkir": namaParkir,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
