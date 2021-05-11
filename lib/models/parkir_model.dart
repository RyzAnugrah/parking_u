import 'dart:convert';

ParkirModel parkirModelFromJson(String str) => ParkirModel.fromJson(json.decode(str));

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
        this.statusLahan,
        this.totalLahan,
        this.lahanTersedia,
        this.lahanTidakTersedia,
        this.linkMap,
        this.tarif1,
        this.tarif2,
        this.tarif3,
        this.imageParkir,
        this.linkImage,
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
    String statusLahan;
    int totalLahan;
    int lahanTersedia;
    int lahanTidakTersedia;
    String linkMap;
    dynamic tarif1;
    dynamic tarif2;
    dynamic tarif3;
    String imageParkir;
    String linkImage;
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
        statusLahan: json["status_lahan"],
        totalLahan: json["total_lahan"],
        lahanTersedia: json["lahan_tersedia"],
        lahanTidakTersedia: json["lahan_tidak_tersedia"],
        linkMap: json["link_map"],
        tarif1: json["tarif_1"],
        tarif2: json["tarif_2"],
        tarif3: json["tarif_3"],
        imageParkir: json["image_parkir"],
        linkImage: json["link_image"],
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
        "status_lahan": statusLahan,
        "total_lahan": totalLahan,
        "lahan_tersedia": lahanTersedia,
        "lahan_tidak_tersedia": lahanTidakTersedia,
        "link_map": linkMap,
        "tarif_1": tarif1,
        "tarif_2": tarif2,
        "tarif_3": tarif3,
        "image_parkir": imageParkir,
        "link_image": linkImage,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
