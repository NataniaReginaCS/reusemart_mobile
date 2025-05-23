import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:reusemart_mobile/HunterPage/HunterHome.dart';
import 'package:reusemart_mobile/KurirPage/KurirHome.dart';
import 'package:reusemart_mobile/client/ApiService.dart';
import 'package:reusemart_mobile/homepage/home.dart';
import 'package:reusemart_mobile/homepage/mainMenu.dart';
import 'package:reusemart_mobile/client/AuthClient.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'reusemart_channel',
  'ReUseMart Notifications',
  description: 'Channel for ReUseMart notifications',
  importance: Importance.high,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isHidden = true;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final ApiService _apiService = ApiService();
  bool _isLoading = false;
  Map? dataForm;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController.text = '';
    _passwordController.text = '';
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Future<void> _login() async {
  //   if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: AwesomeSnackbarContent(
  //           title: 'Warning',
  //           message: 'Please fill all the fields',
  //           contentType: ContentType.warning,
  //         ),
  //         duration: const Duration(seconds: 2),
  //         elevation: 0,
  //         behavior: SnackBarBehavior.floating,
  //         backgroundColor: Colors.transparent,
  //       ),
  //     );
  //     return;
  //   }

  //   setState(() {
  //     _isLoading = true;
  //   });

  //   try {
  //     final response = await _apiService.login(
  //       _emailController.text,
  //       _passwordController.text,
  //     );
  //     await _apiService.saveToken(response['token']);

  //     FirebaseMessaging messaging = FirebaseMessaging.instance;
  //     String? fcmToken = await messaging.getToken();
  //     print("FCM Token: $fcmToken");

  //     if (fcmToken != null) {
  //       await http.post(
  //         Uri.parse('http://10.0.2.2:8000/api/send-welcome-notification'),
  //         headers: {
  //           'Content-Type': 'application/json',
  //           'Authorization': 'Bearer ${response['token']}',
  //         },
  //         body: jsonEncode({
  //           'fcm_token': fcmToken,
  //           'title': 'Selamat Datang!',
  //           'body': 'Anda berhasil login ke ReUseMart.',
  //         }),
  //       );
  //       await flutterLocalNotificationsPlugin.show(
  //         0,
  //         'Selamat Datang!',
  //         'Anda berhasil login ke ReUseMart.',
  //         NotificationDetails(
  //           android: AndroidNotificationDetails(
  //             channel.id,
  //             channel.name,
  //             channelDescription: channel.description,
  //             importance: Importance.max,
  //             priority: Priority.high,
  //           ),
  //         ),
  //       );
  //     }

  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: AwesomeSnackbarContent(
  //           title: 'Success',
  //           message: 'Login Successful',
  //           contentType: ContentType.success,
  //         ),
  //         duration: const Duration(seconds: 2),
  //         elevation: 0,
  //         behavior: SnackBarBehavior.floating,
  //         backgroundColor: Colors.transparent,
  //       ),
  //     );
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => const HomePage()),
  //     );
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: AwesomeSnackbarContent(
  //           title: 'Error',
  //           message: e.toString(),
  //           contentType: ContentType.failure,
  //         ),
  //         duration: const Duration(seconds: 2),
  //         elevation: 0,
  //         behavior: SnackBarBehavior.floating,
  //         backgroundColor: Colors.transparent,
  //       ),
  //     );
  //   } finally {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    margin: MediaQuery.of(context).size.height > 600
                        ? EdgeInsets.only(top: 230)
                        : EdgeInsets.only(top: 50),
                    child: Text('Welcome Back!',
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.w900)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50, left: 25, right: 25),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Color(0xFA8A8A95))),
                    child: TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Email tidak boleh kosong';
                        if (!value.contains('@')) return 'Email tidak valid';
                        return null;
                      },
                      style: TextStyle(color: Color(0xFF8D92A3), fontSize: 15),
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle:
                            TextStyle(color: Color(0xFF8D92A3), fontSize: 15),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.all(15),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color(0xFF8D92A3),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 35, left: 25, right: 25),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Color(0xFA8A8A95))),
                    child: TextFormField(
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Password tidak boleh kosong';

                        return null;
                      },
                      obscureText: _isHidden,
                      style: TextStyle(color: Color(0xFF8D92A3), fontSize: 15),
                      decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle:
                              TextStyle(color: Color(0xFF8D92A3), fontSize: 15),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.all(15),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color(0xFF8D92A3),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isHidden
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Color(0xFF8D92A3),
                            ),
                            onPressed: _toggleVisibility,
                          )),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Mainmenu()),
                            );
                          },
                          child: Text('Lupa Password?',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 41, 77),
                                  fontSize: 12)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: MediaQuery.sizeOf(context).height > 600
                        ? MediaQuery.sizeOf(context).height * 0.05
                        : MediaQuery.sizeOf(context).height * 0.1,
                    decoration: BoxDecoration(
                      color: Color(0xFF1F510F),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _login();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: AwesomeSnackbarContent(
                                title: 'Warning',
                                message: 'Please fill all the fields',
                                contentType: ContentType.warning,
                              ),
                              duration: Duration(seconds: 2),
                              elevation: 0,
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: MediaQuery.of(context).size.height > 600
                            ? EdgeInsets.only(left: 130, right: 130)
                            : EdgeInsets.only(
                                left: 350,
                                right: 350,
                              ),
                      ),
                      child: Text('Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        var response = await AuthClient.login(
            _emailController.text, _passwordController.text);
        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: AwesomeSnackbarContent(
                title: 'Success',
                message: 'Login Successful',
                contentType: ContentType.success,
              ),
              duration: Duration(seconds: 2),
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
            ),
          );
          var data = jsonDecode(response.body);
          if (data['role'] == 'Pembeli') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if (data['role'] == 'Kurir') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => KurirHome()),
            );
          } else if (data['role'] == 'Hunter') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HunterHome()),
            );
          } else if (data['role'] == 'Penitip') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Mainmenu()),
            );
          }
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: AwesomeSnackbarContent(
              title: 'Error',
              message: 'Login Failed',
              contentType: ContentType.failure,
            ),
            duration: Duration(seconds: 2),
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
          ),
        );
      }
    }
  }
}
