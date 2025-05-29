import 'package:flutter/material.dart';
import 'package:reusemart_mobile/client/AuthPembelian.dart';
import 'package:reusemart_mobile/entity/DetailPembelian.dart';
import 'package:reusemart_mobile/merchandise/isimerc.dart';

class HistoryPembelian extends StatefulWidget {
  const HistoryPembelian({Key? key}) : super(key: key);

  @override
  _HistoryPembelianState createState() => _HistoryPembelianState();
}

class _HistoryPembelianState extends State<HistoryPembelian> {
  late Future<List<DetailPembelian>> _pembelian;

  @override
  void initState() {
    super.initState();
    _pembelian = AuthPembelian.getPembelian();
    print(_pembelian);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFF1F510F),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          padding: EdgeInsets.only(top: 10, left: 20),
          icon: Icon(Icons.arrow_back_ios_new),
          iconSize: screenWidth * 0.04,
          color: Color(0xFFF5CB58),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color(0xFF1F510F),
        title: Container(
          margin: EdgeInsets.only(top: 10),
          child: Text('History Pembelian',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              )),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40),
          width: screenWidth,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
            border: Border.all(color: Color(0xFFe0e0e0)),
          ),
          child: Column(
            children: [
              Container(
                margin:
                    EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 35),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFF0F0F0),
                  border: Border.all(color: Color(0xFFe0e0e0)),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari Riwayat Pembelian',
                    hintStyle:
                        TextStyle(color: Color(0xFFBDBDBD), fontSize: 15),
                    prefixIcon: Icon(Icons.search, color: Color(0xFFBDBDBD)),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
              FutureBuilder<List<DetailPembelian>>(
                future: _pembelian,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text('Terjadi kesalahan: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('Tidak ada riwayat pembelian.'));
                  } else {
                    final pembelianList = snapshot.data!;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: pembelianList.length,
                      itemBuilder: (context, index) {
                        final item = pembelianList[index];
                        return Card(
                          color: Color(0xFFF0F0F0),
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            leading: Icon(Icons.shopping_bag,
                                color: Color(0xFF1F510F)),
                            title: Text(
                                "Order No.${item.pembelian.id_pembelian}",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                    'Tanggal: ${item.pembelian.tanggal_laku.toLocal().toString().split(' ')[0]}',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12)),
                                Text(
                                    'Status: ${item.pembelian.status_pengiriman}',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12)),
                                Text(
                                    'Metode Pengiriman: ${item.pembelian.metode_pengiriman}',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12)),
                              ],
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Rp ${item.pembelian.total.toStringAsFixed(0)}',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                SizedBox(
                                  width: 70,
                                  height: 22,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              katalogmerchandise(),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF1F510F),
                                      padding: EdgeInsets.zero,
                                      minimumSize: Size(20, 25),
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: Text(
                                      'Detail',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
