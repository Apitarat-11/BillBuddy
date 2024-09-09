import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class App2 extends StatefulWidget {
  @override
  _App2State createState() => _App2State();
}

class _App2State extends State<App2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // ทำให้ตัวเนื้อหาขยายไปด้านหลัง AppBar
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/BB.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.3), // ทำให้ภาพพื้นหลังอ่อนลง
                  BlendMode.dstATop,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ใช้ SafeArea เพื่อให้แน่ใจว่าเนื้อหาไม่ถูกบังโดยแถบสถานะ
                  SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16),
                        // Header
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 179, 143, 204)
                                .withOpacity(0.8), // โปร่งแสง
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 30,
                                child: Icon(
                                  Icons.person,
                                  size: 40,
                                  color: Color(0xFF7B5EB4),
                                ),
                              ),
                              SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'UserName',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'คงเหลือ ฿2,500',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'วันนี้',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white70,
                                    ),
                                  ),
                                  Text(
                                    '฿420',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),

                  // กราฟแท่ง
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'อาหาร & เครื่องดื่ม',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 8),
                                Container(
                                  height: 50,
                                  width: 20,
                                  color: Colors.red,
                                  child: Center(
                                    child: Text(
                                      '354',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'ของใช้',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 8),
                                Container(
                                  height: 30,
                                  width: 20,
                                  color: Colors.blue,
                                  child: Center(
                                    child: Text(
                                      '65',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'ของฟุ่มเฟือย',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 8),
                                Container(
                                  height: 10,
                                  width: 20,
                                  color: Colors.yellow,
                                  child: Center(
                                    child: Text(
                                      '1',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),

                  // รายการการใช้จ่าย
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            '14 กุมภาพันธ์ 2024',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Divider(height: 1, color: Colors.grey),
                        _buildTransactionRow(
                          '15:30',
                          '7-Eleven จ่าป่าหวาย',
                          'ยอดสุทธิ',
                          '40.00',
                          '13.00',
                          '26.00',
                        ),
                        Divider(height: 1, color: Colors.grey),
                        _buildTransactionRow(
                          '11:53',
                          'Makro CP Axtra พะเยา',
                          'ยอดสุทธิ',
                          '125.00',
                          '13.00',
                          '129.75',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionRow(
    String time,
    String title,
    String type,
    String price,
    String discount,
    String total,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            time,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(
                  type,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '฿$price',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 4),
              Text(
                '- ฿$discount',
                style: TextStyle(fontSize: 14, color: Colors.red),
              ),
              SizedBox(height: 4),
              Text(
                '฿$total',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: App2(),
  ));
}
