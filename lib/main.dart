import 'package:flutter/material.dart';
import 'package:app_billbuddy/screens/home.dart'; 
import 'package:app_billbuddy/screens/login_page.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(), // แสดง SplashScreen ก่อน
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin(); // นำทางไปหน้า LoginPage แทน Home
  }

  _navigateToLogin() async {
    await Future.delayed(Duration(seconds: 3), () {}); // หน่วงเวลา 3 วินาที
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => LoginPage()), // เปลี่ยนไปยังหน้า LoginPage
    );
  }

  @override
  Widget build(BuildContext context) {
    return MyContainer(); // แสดงหน้า MyContainer
  }
}

class MyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/B.png',
              width: 300,
            ),
          ],
        ),
      ),
    );
  }
}  
