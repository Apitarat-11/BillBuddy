import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/BB.png'), // รูปภาพพื้นหลัง
            fit: BoxFit.cover, // ทำให้ภาพครอบคลุมทั้งพื้นที่
            alignment: Alignment.center,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.3), // ทำให้ภาพพื้นหลังอ่อนลง
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Column(
          children: [
            Spacer(), // ตัวช่วยในการเลื่อนวัตถุให้ชิดด้านล่าง
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end, // ทำให้วัตถุชิดล่าง
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // การทำงานเมื่อกดปุ่มเลือกไฟล์
                    },
                    icon: Icon(Icons.file_copy), // ไอคอนสำหรับเลือกไฟล์
                    label: Text('เลือกไฟล์'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[700], // สีพื้นหลังปุ่ม
                      foregroundColor: Colors.white, // สีตัวอักษรและไอคอน
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    ),
                  ),
                  SizedBox(height: 20), // เว้นช่องว่างเล็กน้อยระหว่างปุ่ม
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // การทำงานเมื่อกดปุ่มปิด
                    },
                    child: Icon(Icons.close),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                      backgroundColor: Colors.blue, // สีของปุ่มปิด
                      foregroundColor: Colors.white, // สีของไอคอนปิด
                    ),
                  ),
                  SizedBox(height: 20), // ระยะห่างจากขอบล่างของหน้าจอ
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
