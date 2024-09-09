import 'dart:convert';
import 'package:app_billbuddy/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// นำเข้าหน้าหลักที่คุณต้องการเชื่อมต่อ เช่น Home
import 'package:app_billbuddy/page/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _login() async {
    final url = Uri.parse('https://www.melivecode.com/api/login');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'username': _usernameController.text,
      'password': _passwordController.text
    });

    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      _showSnackBar(jsonResponse['message']);
    } else {
      final jsonResponse = jsonDecode(response.body);
      _showSnackBar(jsonResponse['message']);
    }
  }

  void _showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _goToMainPage() {
    // สร้างการนำทางไปหน้าหลัก (ในที่นี้คือ Home)
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()), // เปลี่ยนเป็นหน้า Home
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image Header
                  Image.asset(
                    'assets/images/B.png', // Replace with your local image
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(height: 16),

                  // App Name and Subtitle
                  const Text(
                    'BILL BUDDY',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'บิลบัดดี้ เพื่อนคู่กระเป๋า จัดการค่าใช้จ่ายได้ง่ายๆ\nจากบิลในสลิปร้านค้า ดำเนินการต่อได้เลย!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Username Field
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'อีเมลหรือชื่อผู้ใช้',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรุณาใส่อีเมลหรือชื่อผู้ใช้';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Password Field
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'รหัสผ่าน',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.visibility),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรุณาใส่รหัสผ่าน';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Remember Password Checkbox
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (bool? value) {},
                      ),
                      const Text('จดจำรหัสผ่านไว้'),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          // Handle forgot password
                        },
                        child: const Text(
                          'ลืมรหัสผ่าน',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Login Button
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _login();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text('เข้าสู่ระบบ'),
                  ),
                  const SizedBox(height: 16),

                  // Register Button
                  TextButton(
                    onPressed: () {
                      // Navigate to the registration page
                    },
                    child: const Text(
                      'สมัครสมาชิก',
                      style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Continue Without Login Button
                  OutlinedButton(
                    onPressed: _goToMainPage,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      side: const BorderSide(color: Colors.orange),
                    ),
                    child: const Text(
                      'เริ่มต้นใช้งาน',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
 