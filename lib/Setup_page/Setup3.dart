import 'package:flutter/material.dart';

class Setup3 extends StatefulWidget {
  const Setup3({Key? key}) : super(key: key);

  @override
  _Setup3dState createState() => _Setup3dState();
}

class _Setup3dState extends State<Setup3> {
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
        title: Text('การรักษาความปลอดภัย'),
      ),
    );
  }
}
