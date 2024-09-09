import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class App1 extends StatefulWidget {
  const App1({Key? key}) : super(key: key);

  @override
  _App1dState createState() => _App1dState();
}

class _App1dState extends State<App1> {
  // ตัวแปรที่เก็บข้อมูลเดือนและปีที่เลือก
  String selectedMonth = 'กุมภาพันธ์';
  String selectedYear = '2024';

  // รายการของเดือนและปี
  final List<String> months = [
    'มกราคม',
    'กุมภาพันธ์',
    'มีนาคม',
    'เมษายน',
    'พฤษภาคม',
    'มิถุนายน',
    'กรกฎาคม',
    'สิงหาคม',
    'กันยายน',
    'ตุลาคม',
    'พฤศจิกายน',
    'ธันวาคม'
  ];

  final List<String> years = ['2022', '2023', '2024'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ใช้ Container ที่มี BoxDecoration เพื่อกำหนดภาพพื้นหลัง
          Container(
            width: double.infinity, // กำหนดความกว้างเต็มจอ
            height: double.infinity, // กำหนดความสูงเต็มจอ
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
          // เนื้อหาภายใน
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(Icons.account_circle,
                          size: 80, color: Color.fromARGB(255, 70, 62, 62)),
                      SizedBox(width: 15),
                      Text(
                        'UserName',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 70, 62, 62),
                        ),
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'คงเหลือ',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          Text(
                            '฿ -',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 70, 62, 62),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white
                          .withOpacity(0.8), // ใส่พื้นหลังขาวแบบโปร่งใส
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Color.fromARGB(255, 11, 11, 11).withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, -3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Dropdown สำหรับเลือกเดือนและปี
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DropdownButton<String>(
                              value: selectedMonth,
                              items: months.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  selectedMonth = newValue!;
                                });
                              },
                            ),
                            DropdownButton<String>(
                              value: selectedYear,
                              items: years.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  selectedYear = newValue!;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircularPercentIndicator(
                              radius: 60.0,
                              lineWidth: 20.0,
                              percent: 0.0,
                              center: Text("0%"),
                              progressColor: const Color.fromARGB(255, 0, 0, 0),
                              backgroundColor: Colors.grey.shade200,
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('กำหนดค่าใช้จ่ายของเดือนนี้',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black87)),
                                Text('฿ -',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87)),
                                SizedBox(height: 18),
                                Text('ค่าใช้จ่ายเหลือเดือนนี้',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black87)),
                                Text('฿ -',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87)),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Divider(),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('ว่างเปล่า',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black54)),
                              Text('0.00 ฿  0.00 %',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black54)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: App1(),
  ));
}
