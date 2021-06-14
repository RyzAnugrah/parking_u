import 'dart:convert';

BookingModel bookingModelFromJson(String str) =>
    BookingModel.fromJson(json.decode(str));

String bookingModelToJson(BookingModel data) => json.encode(data.toJson());

class BookingModel {
  BookingModel({
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
  });

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

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
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
      );

  Map<String, dynamic> toJson() => {
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
      };
}
