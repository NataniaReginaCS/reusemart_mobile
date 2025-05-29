import 'dart:convert';

import 'package:reusemart_mobile/entity/Pembelian.dart';

class DetailPembelian {
  final int id_detail_pembelian;
  final Pembelian pembelian;

  DetailPembelian({
    required this.id_detail_pembelian,
    required this.pembelian,
  });

  factory DetailPembelian.fromJson(Map<String, dynamic> json) {
    return DetailPembelian(
      id_detail_pembelian: json['id_detail_pembelian'],
      pembelian: Pembelian.fromJson(json['pembelian']),
    );
  }
}
