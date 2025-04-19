import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:reusemart_mobile/auth/login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
          ),
        ),
        home: AnimatedSplashScreen(
            duration: 3000,
            splash: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/cin.png',
                  width: screenWidth > 600
                      ? screenWidth * 0.35
                      : screenWidth * 0.6,
                  height: screenWidth > 600
                      ? screenHeight * 0.6
                      : screenHeight * 0.25,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: screenHeight * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'ReUse',
                      style: TextStyle(
                          fontSize: screenWidth > 600
                              ? screenWidth * 0.05
                              : screenWidth * 0.1,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    Text(
                      'Mart',
                      style: TextStyle(
                          fontSize: screenWidth > 600
                              ? screenWidth * 0.05
                              : screenWidth * 0.1,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF5CB58)),
                    ),
                  ],
                ),
              ],
            ),
            splashIconSize: 500,
            nextScreen: Login(),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: Color(0xFF1F510F)));
  }
}
