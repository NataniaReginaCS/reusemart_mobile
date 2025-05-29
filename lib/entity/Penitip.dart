import 'dart:convert';

class Penitip {
  int id_penitip;
  String nama;
  String email;
  String password;
  String telepon;
  double wallet;
  bool badges;
  int total_rating;
  String? foto_ktp;
  int no_ktp;

  Penitip({
    required this.id_penitip,
    required this.nama,
    required this.email,
    required this.password,
    required this.telepon,
    required this.wallet,
    required this.badges,
    required this.no_ktp,
    required this.total_rating,
  });

  factory Penitip.fromRawJson(String str) => Penitip.fromJson(json.decode(str));
  factory Penitip.fromJson(Map<String, dynamic> json) {
    return Penitip(
      id_penitip: json["id_penitip"],
      nama: json["nama"],
      email: json["email"],
      password: json["password"],
      telepon: json["telepon"],
      wallet: json["wallet"]?.toDouble() ?? 0.0,
      badges: json["badges"] ?? false,
      total_rating: json["total_rating"] ?? 0,
      no_ktp: json["no_ktp"] ?? 0,
      
    );
  }

  String toRawJson() => json.encode(toJson());
  Map<String, dynamic> toJson() => {
        "id_penitip": id_penitip,
        "nama": nama,
        "email": email,
        "password": password,
        "telepon": telepon,
        "no_ktp": no_ktp,
        "wallet": wallet,
        "badges": badges,
      };
}
