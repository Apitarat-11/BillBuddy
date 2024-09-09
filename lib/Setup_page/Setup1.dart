import 'package:flutter/material.dart';

class Setup1 extends StatefulWidget {
  const Setup1({Key? key}) : super(key: key);

  @override
  _Setup1dState createState() => _Setup1dState();
}

class _Setup1dState extends State<Setup1> {
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
                fit: BoxFit.cover,
                alignment: Alignment.center,
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.3),
                  BlendMode.dstATop,
                ),
              ),
            ),
          ),
          // เนื้อหา
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // AppBar และเนื้อหาด้านบน
                AppBar(
                  title: Text('บัญชีและโปรไฟล์'),
                  backgroundColor: Colors.transparent, // ทำให้ AppBar โปร่งใส
                  elevation: 0,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(height: 20),
                // เนื้อหาด้านล่าง
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                AssetImage('assets/images/avatar.png'),
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'UserName',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(Icons.attach_money),
                                  Text('5,000', style: TextStyle(fontSize: 18)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      _buildUserInfoCard(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfoCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildUserInfoRow('ชื่อผู้ใช้งาน', 'UserName'),
          _buildUserInfoRow('อีเมล', 'BillBuddy@gmail.com'),
          _buildUserInfoRow('วันเกิด', '10 ก.ย. 2002'),
          _buildUserInfoRow('เขตเวลา', 'กรุงเทพ'),
        ],
      ),
    );
  }

  Widget _buildUserInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16, color: Colors.purple),
          ),
        ],
      ),
    );
  }
}
