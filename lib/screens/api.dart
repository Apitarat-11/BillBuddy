import 'dart:convert'; // สำหรับการเข้ารหัส JSON
import 'package:http/http.dart' as http;

// ฟังก์ชันสำหรับลงทะเบียนผู้ใช้
Future<void> registerUser(
    String username, String email, String password) async {
  final url =
      Uri.parse('http://127.0.0.1/flutter_api/register.php'); // URL ของ API

  // สร้างข้อมูลที่ต้องการส่งไปยัง API
  final response = await http.post(
    url,
    body: {
      'username': username,
      'email': email,
      'password': password,
    },
  );

  // ตรวจสอบสถานะการตอบกลับ
  if (response.statusCode == 200) {
    // ถ้าการตอบกลับสำเร็จ
    final responseData = json.decode(response.body);
    print(responseData); // แสดงผลลัพธ์ที่ได้จาก API
  } else {
    // ถ้ามีข้อผิดพลาดในการเรียก API
    print('Failed to register: ${response.statusCode}');
  }
}
