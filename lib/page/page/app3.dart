import 'package:flutter/material.dart';

class App3 extends StatefulWidget {
  @override
  _App3State createState() => _App3State();
}

class _App3State extends State<App3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ใช้ Container ที่มี BoxDecoration เพื่อกำหนดภาพพื้นหลัง
          Container(
            width: 550.0, // กำหนดความกว้างของ
            height: 1100.0, // กำหนดความสูงของ
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage('assets/images/BB.png'), // ที่อยู่ของภาพพื้นหลัง
                fit: BoxFit.cover, // ทำให้ภาพครอบคลุมทั้งพื้นที่
                alignment: Alignment.center,
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.3), // ทำให้ภาพพื้นหลังอ่อนลง
                  BlendMode.dstATop,
                ),
              ),
            ),
          ),
          Column(
            children: [
              // ใช้ SafeArea เพื่อให้แน่ใจว่าเนื้อหาถูกแสดงตั้งแต่แถบสถานะ
              SafeArea(
                child: Container(),
              ),
              Container(
                color: Colors.orange.shade200.withOpacity(0.8),
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'การแจ้งเตือน',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.settings,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ListTile(
                        title: Text(
                          '11:54 ค่าใช้จ่ายเกินครึ่งสำหรับเดือนนี้แล้วนะ',
                          style: TextStyle(fontSize: 16),
                        ),
                        subtitle: Text(
                          'ลองกดดูหน่อยครึ่งเดือนที่ผ่านมาการใช้เงินเป็นอย่างไรบ้าง',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        trailing: Text(
                          'วันนี้',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
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
}
