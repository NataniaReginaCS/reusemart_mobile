import 'dart:convert';

class JadwalPengiriman{
  int id_pembelian ;
  DateTime tanggal_pengiriman;
  String status_pengiriman;
  String metode_pengiriman;
  String nama_pembeli;
  String nama_jalan;
  
  JadwalPengiriman({
    required this.id_pembelian,
    required this.tanggal_pengiriman,
    required this.status_pengiriman,
    required this.metode_pengiriman,
    required this.nama_pembeli,
    required this.nama_jalan,
  });

  factory JadwalPengiriman.fromRawJson(String str) =>
      JadwalPengiriman.fromJson(json.decode(str));

  factory JadwalPengiriman.fromJson(Map<String, dynamic> json) {
    return JadwalPengiriman(
      id_pembelian: json["id_pembelian"],
      tanggal_pengiriman: DateTime.parse(json["tanggal_pengiriman"]),
      status_pengiriman: json["status_pengiriman"],
      metode_pengiriman: json["metode_pengiriman"],
      nama_pembeli: json["nama_pembeli"],
      nama_jalan: json["nama_jalan"],
    );
  }

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "id_pembelian": id_pembelian,
        "tanggal_pengiriman": tanggal_pengiriman.toIso8601String(),
        "status_pengiriman": status_pengiriman,
        "metode_pengiriman": metode_pengiriman,
        "nama_pembeli": nama_pembeli,
        "nama_jalan": nama_jalan,
      };
}