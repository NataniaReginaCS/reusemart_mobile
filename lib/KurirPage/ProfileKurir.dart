import 'package:flutter/material.dart';

class ProfileKurir extends StatefulWidget {
  const ProfileKurir({super.key});

  @override
  State<ProfileKurir> createState() => _ProfileKurirState();
}

class _ProfileKurirState extends State<ProfileKurir> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/kurir.png'),
                ),
                const SizedBox(
                    width: 16), // Tambahkan padding horizontal di sini
                Container(
                  child: Column(
                    children: [
                      Text(
                        'Nama Kurir',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Icon(Icons.account_balance_wallet_rounded,
                              color: Colors.orange[400], size: 30),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Rp xxx',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Update Pengiriman',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selesaikan pengiriman terjadwal',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 8,
                ),
                OverflowBar(
                  alignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[900],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        // Aksi untuk menyelesaikan pengiriman
                      },
                      child: Text('Update'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top:20),
            child: Divider(
              color: Color.fromARGB(255, 245, 203, 88),
              thickness: 2,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Informasi Akun',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nonaktifkan Akun',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 8,
                ),
                OverflowBar(
                  alignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[900],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        // Aksi untuk menyelesaikan pengiriman
                      },
                      child: Text('Nonaktif'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top:20),
            child: Divider(
              color: Color.fromARGB(255, 245, 203, 88),
              thickness: 2,
            ),
          ),
        ],
      ),
    );
  }
}
