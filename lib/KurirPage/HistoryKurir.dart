import 'package:flutter/material.dart';

class Historykurir extends StatefulWidget {
  const Historykurir({super.key});

  @override
  State<Historykurir> createState() => _HistorykurirState();
}

class _HistorykurirState extends State<Historykurir> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          title: Text('Riwayat',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black)),
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          margin: EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
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
                                Container(
                                  width: MediaQuery.of(context).size.width - 40,
                                  
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                  
                                    children: [
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          "17 Januari 2025 18:00:00",
                                          style: TextStyle(
                                            fontSize: 17,
                                            
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
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
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: Colors.black45,
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
        ));
  }
}
