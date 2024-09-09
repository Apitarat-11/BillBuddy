import 'package:flutter/material.dart';

class Setup2 extends StatefulWidget {
  const Setup2({Key? key}) : super(key: key);

  @override
  _Setup2dState createState() => _Setup2dState();
}

class _Setup2dState extends State<Setup2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
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
      ]),
      appBar: AppBar(
        title: Text('การจัดการค่าใช้จ่าย'),
      ),
    );
  }
}
