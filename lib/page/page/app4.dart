import 'package:flutter/material.dart';
import 'package:app_billbuddy/Setup_page/Setup1.dart';
import 'package:app_billbuddy/Setup_page/Setup2.dart';
import 'package:app_billbuddy/Setup_page/Setup3.dart';
import 'package:app_billbuddy/Setup_page/Setup4.dart';
import 'package:app_billbuddy/Setup_page/Setup5.dart';
import 'package:app_billbuddy/Setup_page/Setup6.dart';
import 'package:app_billbuddy/screens/login_page.dart';

class App4 extends StatefulWidget {
  @override
  _App4State createState() => _App4State();
}

class _App4State extends State<App4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ภาพพื้นหลัง
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/BB.png'),
                fit: BoxFit.cover, // ทำให้ภาพครอบคลุมทั้งพื้นที่
                alignment: Alignment.center,
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.3), // ทำให้ภาพพื้นหลังอ่อนลง
                  BlendMode.dstATop,
                ),
              ),
            ),
          ),
          // เนื้อหา
          Column(
            children: [
              // AppBar แบบกำหนดเอง
              AppBar(
                title: Text('ตั้งค่า'),
                backgroundColor: Colors.transparent, // ทำให้ AppBar โปร่งใส
                elevation: 0, // ลบเงาของ AppBar
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    // ฟังก์ชันเมื่อกดปุ่มย้อนกลับ
                  },
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(16.0),
                  children: [
                    _buildListTile(
                      icon: Icons.person,
                      text: 'บัญชีและโปรไฟล์',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Setup1()),
                        );
                      },
                    ),
                    _buildListTile(
                      icon: Icons.account_balance_wallet,
                      text: 'การจัดการค่าใช้จ่าย',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Setup2()),
                        );
                      },
                    ),
                    _buildListTile(
                      icon: Icons.security,
                      text: 'การรักษาความปลอดภัย',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Setup3()),
                        );
                      },
                    ),
                    _buildListTile(
                      icon: Icons.language,
                      text: 'ภาษา',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Setup4()),
                        );
                      },
                    ),
                    _buildListTile(
                      icon: Icons.help,
                      text: 'การช่วยเหลือสนับสนุน',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Setup5()),
                        );
                      },
                    ),
                    _buildListTile(
                      icon: Icons.info,
                      text: 'เกี่ยวกับ',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Setup6()),
                        );
                      },
                    ),
                    Divider(), // เส้นแบ่ง
                    _buildListTile(
                      icon: Icons.exit_to_app,
                      text: 'ออกจากระบบ',
                      iconColor: Colors.red,
                      textColor: Colors.red,
                      onTap: () {
                        _logout(context); // เรียกใช้ฟังก์ชันล็อคเอาท์
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ฟังก์ชัน Logout ที่พาไปยังหน้าล็อคอิน
  void _logout(BuildContext context) {
    // นำทางกลับไปหน้าล็อคอินและลบหน้าก่อนหน้าทั้งหมด
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()), // หน้าล็อคอิน
      (Route<dynamic> route) => false, // ลบหน้าก่อนหน้าทั้งหมด
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String text,
    Color iconColor = Colors.black,
    Color textColor = Colors.black,
    required Function() onTap,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey), // เพิ่มเส้นขอบ
        borderRadius: BorderRadius.circular(8.0), // มุมโค้ง
      ),
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold, // ทำให้ตัวหนังสือเข้มขึ้น
            fontSize: 18.0, // ขนาดตัวหนังสือใหญ่ขึ้น
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: App4(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent, // ทำให้ AppBar โปร่งใสในทุกหน้า
        ),
      ),
    ));
