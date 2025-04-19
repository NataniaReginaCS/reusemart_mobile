import 'package:flutter/material.dart';
import 'package:reusemart_mobile/homepage/home.dart';
import 'package:reusemart_mobile/homepage/profilePembeli.dart';
import 'package:reusemart_mobile/homepage/historyPPH.dart';

class Mainmenu extends StatefulWidget {
  final int? id;
  final int selectedIndex;
  const Mainmenu({super.key, this.id, this.selectedIndex = 0});

  @override
  State<Mainmenu> createState() => _MainmenuState();
}

class _MainmenuState extends State<Mainmenu> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      HomePage(),
      HistoryPPH(),
      ProfilePembeli(),
    ];

    return Scaffold(
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height > 600
            ? MediaQuery.of(context).size.height * 0.1
            : MediaQuery.of(context).size.height * 0.207,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFD9D9D9)),
        ),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xFF1F510F),
          unselectedItemColor: Color(0xFF8D92A3),
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
