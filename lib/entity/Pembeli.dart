import 'dart:convert';

class Pembeli {
  int id_pembeli;
  String nama;
  String email;
  String password;
  String telepon;
  int poin;
  String foto;

  Pembeli({
    required this.id_pembeli,
    required this.nama,
    required this.email,
    required this.password,
    required this.telepon,
    required this.poin,
    required this.foto,
  });

  factory Pembeli.fromRawJson(String str) => Pembeli.fromJson(json.decode(str));
  factory Pembeli.fromJson(Map<String, dynamic> json) {
    return Pembeli(
      id_pembeli: int.tryParse(json["id_pembeli"].toString()) ?? 0,
      nama: json["nama"],
      email: json["email"],
      password: json["password"],
      telepon: json["telepon"],
      poin: int.tryParse(json["poin"].toString()) ?? 0,
      foto: json['foto'] != null && json['foto'].isNotEmpty
          ? 'http://10.0.2.2:8000/${json['foto']}'
          : '',
    );
  }

  String toRawJson() => json.encode(toJson());
  Map<String, dynamic> toJson() => {
        "id_pembeli": id_pembeli,
        "nama": nama,
        "email": email,
        "password": password,
        "telepon": telepon,
        "poin": poin,
        "foto": foto,
      };
}
