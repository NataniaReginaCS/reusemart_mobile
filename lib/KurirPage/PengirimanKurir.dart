import 'package:flutter/material.dart';

class PengirimanKurir extends StatefulWidget {
  const PengirimanKurir({Key? key}) : super(key: key);

  @override
  _PengirimanKurirState createState() => _PengirimanKurirState();
}

class _PengirimanKurirState extends State<PengirimanKurir> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[900],
          surfaceTintColor: Colors.transparent,
          title: Text('Pengiriman',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white
              )),
              centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: IconButton(
              
              icon : Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          elevation: 0,
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.green[900],
          ),
          child: Container( 
            margin: EdgeInsets.only(top: 20),
            width: double.infinity,
            decoration : BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft:  Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin:
                      EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 35),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFF0F0F0),
                      border: Border.all(color: Color(0xFFe0e0e0))),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Cari',
                      hintStyle:
                          TextStyle(color: Color(0xFFBDBDBD), fontSize: 15),
                      prefixIcon: Icon(Icons.search, color: Color(0xFFBDBDBD)),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 15, left: 20, right: 20),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          "Nama Pembeli",
                                          style: TextStyle(fontSize: 17),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          "Jalan Tambak Bayan",
                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        "17 Januari 2025 18:00:00",
                                        style: TextStyle(
                                            fontSize: 17,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        minimumSize: Size(80, 30),
                                        backgroundColor: Colors.green[900],
                                      ),
                                      child: Text("Selesai",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Color.fromARGB(255, 245, 203, 88),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
