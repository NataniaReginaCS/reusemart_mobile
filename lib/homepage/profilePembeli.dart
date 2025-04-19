import 'package:flutter/material.dart';
import 'package:reusemart_mobile/auth/login.dart';
import 'package:reusemart_mobile/merchandise/isimerc.dart';

class ProfilePembeli extends StatefulWidget {
  const ProfilePembeli({Key? key}) : super(key: key);

  @override
  _ProfilePembeliState createState() => _ProfilePembeliState();
}

class _ProfilePembeliState extends State<ProfilePembeli> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        title: Center(
          child: Text('        Profile',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              )),
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Login()));
            },
            icon: Icon(Icons.logout),
            color: Colors.black,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 20, right: 30),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('images/icon.png'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Text(
                      'Nama Pengguna',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 40, left: 20),
                child: Text(
                  'Poin',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Poin yang dimiliki :',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '100',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Poin yang digunakan : ',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '100',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Color(0xFFF5CB58),
                thickness: 1,
              ),
              Container(
                margin: EdgeInsets.only(top: 15, left: 20),
                child: Text(
                  'Klaim Merchandise',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, left: 20),
                child: Text(
                  'Tukarkan poin dengan merchandise',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => katalogmerchandise(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1F510F),
                      minimumSize: Size(25, 30),
                    ),
                    child: Text('Tukar',
                        style: TextStyle(fontSize: 15, color: Colors.white)),
                  ),
                ],
              ),
              Divider(
                color: Color(0xFFF5CB58),
                thickness: 1,
              ),
              Container(
                margin: EdgeInsets.only(top: 15, left: 20),
                child: Text(
                  'Informasi Akun',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, left: 20),
                child: Text(
                  'Nonaktifkan Akun',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF9A282A),
                      minimumSize: Size(25, 30),
                    ),
                    child: Text('Nonaktif',
                        style: TextStyle(fontSize: 15, color: Colors.white)),
                  ),
                ],
              ),
              Divider(
                color: Color(0xFFF5CB58),
                thickness: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
