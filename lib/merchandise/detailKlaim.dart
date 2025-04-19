import 'package:flutter/material.dart';
import 'package:reusemart_mobile/merchandise/berhasilKlaim.dart';

class DetailKlaim extends StatefulWidget {
  const DetailKlaim({Key? key}) : super(key: key);
  @override
  _DetailKlaimState createState() => _DetailKlaimState();
}

class _DetailKlaimState extends State<DetailKlaim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F510F),
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.only(top: 10, left: 20),
          icon: Icon(Icons.arrow_back_ios_new),
          iconSize: MediaQuery.of(context).size.height * 0.04,
          color: Color(0xFFF5CB58),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color(0xFF1F510F),
        title: Container(
          margin: EdgeInsets.only(top: 10),
          child: Text('Detail Merchandise',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              )),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
            border: Border.all(color: Color(0xFFe0e0e0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                width: MediaQuery.of(context).size.width > 600
                    ? MediaQuery.of(context).size.width * 0.6
                    : MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width > 600
                    ? MediaQuery.of(context).size.height * 0.50
                    : MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  color: Color(0xFFF5CB58),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'images/icon.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Text(
                  'Nama Merchandise',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width > 600
                          ? MediaQuery.of(context).size.width * 0.03
                          : MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Container(
                margin: MediaQuery.of(context).size.width > 600
                    ? EdgeInsets.only(top: 50, right: 650)
                    : EdgeInsets.only(top: 50, right: 200),
                child: Text(
                  'Poin Barang',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width > 600
                        ? MediaQuery.of(context).size.width * 0.03
                        : MediaQuery.of(context).size.width * 0.05,
                    color: Color(0xFF1F510F),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Divider(
                color: Color(0xFFF5CB58),
                thickness: 2,
                indent: 50,
                endIndent: 50,
              ),
              Container(
                margin: MediaQuery.of(context).size.width > 600
                    ? EdgeInsets.only(top: 5, right: 675)
                    : EdgeInsets.only(top: 5, right: 220),
                child: Text(
                  'Stok Barang',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width > 600
                        ? MediaQuery.of(context).size.width * 0.025
                        : MediaQuery.of(context).size.width * 0.04,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: MediaQuery.of(context).size.width > 600
                    ? EdgeInsets.only(top: 5, right: 570)
                    : EdgeInsets.only(top: 5, right: 140),
                child: Text(
                  'Deskripsi barang disini',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width > 600
                        ? MediaQuery.of(context).size.width * 0.025
                        : MediaQuery.of(context).size.width * 0.04,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.22,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1F510F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.2,
                      vertical: MediaQuery.of(context).size.width > 600
                          ? MediaQuery.of(context).size.width * 0.012
                          : MediaQuery.of(context).size.height * 0.01),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BerhasilKlaim(),
                    ),
                  );
                },
                child: Text(
                  'Redeem',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width > 600
                        ? MediaQuery.of(context).size.width * 0.03
                        : MediaQuery.of(context).size.width * 0.05,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
