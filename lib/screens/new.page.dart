import 'dart:io'; // สำหรับการจัดการไฟล์
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart'; // สำหรับเลือกไฟล์
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart'; // สำหรับ OCR

class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  File? _selectedImage; // ตัวแปรเก็บไฟล์รูปภาพที่เลือก
  String _extractedText = ''; // ตัวแปรเก็บข้อความที่ดึงออกมาจากรูปภาพ

  // ฟังก์ชันสำหรับการเลือกไฟล์รูปภาพจากเครื่อง
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image, // เลือกเฉพาะไฟล์รูปภาพ
    );

    if (result != null) {
      setState(() {
        _selectedImage = File(result.files.first.path!);
      });

      // เรียกฟังก์ชัน OCR เพื่อสกัดข้อความจากรูปภาพ
      await _extractTextFromImage();
    } else {
      print('ไม่ได้เลือกไฟล์');
    }
  }

  // ฟังก์ชัน OCR เพื่อดึงข้อความจากรูปภาพ
  Future<void> _extractTextFromImage() async {
    if (_selectedImage == null) return;

    // เตรียมรูปภาพสำหรับการวิเคราะห์
    final inputImage = InputImage.fromFile(_selectedImage!);

    // สร้าง TextRecognizer สำหรับการ OCR
    final textRecognizer = TextRecognizer();

    // ประมวลผลรูปภาพและดึงข้อความออกมา
    final recognizedText = await textRecognizer.processImage(inputImage);

    // อัปเดตข้อความที่ดึงออกมาใน UI
    setState(() {
      _extractedText = recognizedText.text;
    });

    // ปิดตัวประมวลผลเพื่อประหยัดทรัพยากร
    textRecognizer.close();
  }

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
                    onPressed: _pickFile, // เรียกฟังก์ชันเลือกไฟล์
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
                  if (_selectedImage != null) // ถ้าเลือกไฟล์แล้วให้แสดงรูป
                    Container(
                      width: 300, // กำหนดขนาดของรูปภาพที่แสดง
                      height: 300,
                      child: Image.file(
                        _selectedImage!,
                        fit: BoxFit.cover, // ปรับขนาดรูปภาพให้พอดี
                      ),
                    ),
                  SizedBox(height: 20), // เว้นระยะห่างระหว่างปุ่ม
                  if (_extractedText.isNotEmpty) // ถ้ามีข้อความให้แสดง
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _extractedText, // แสดงข้อความที่ดึงออกมาจากรูปภาพ
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
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
